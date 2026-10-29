# CẨM NANG HƯỚNG DẪN CÀI ĐẶT ZALO BOT AI TOÀN TẬP

**Kiến trúc: Hermes Agent + 2anh-zalo-bot + OpenViking Memory + VPS Bnix**

---

## 1. TỔNG QUAN KIẾN TRÚC 5 LỚP

Hệ thống Zalo Bot AI thông minh vận hành độc lập 24/7 theo kiến trúc phân lớp chuyên biệt:

1. **Lớp 1 - Hạ tầng VPS 24/7**: Máy chủ ảo IP tĩnh tại Việt Nam (Bnix), duy trì mạng thông suốt, không đổi IP bất thường.
2. **Lớp 2 - Cổng kết nối Zalo (Sidecar)**: Dựa trên repo `2anh-zalo-bot` (phát triển từ `abs-zalo-bot`), giao tiếp với Hermes qua WebSocket nội bộ, quản lý session cookie và rate limit chống khóa nick.
3. **Lớp 3 - Bộ não suy luận (Hermes Agent)**: Lõi AI Agent mã nguồn mở của Nous Research, lập luận đa bước (CoT), điều phối Model LLM và gọi công cụ (Tool Use).
4. **Lớp 4 - Trí nhớ & Ngữ cảnh (OpenViking)**: Context Database phân tầng L0/L1/L2 từ ByteDance/Volcengine, lưu trữ trí nhớ dài hạn và bóc tách thực thể bất đồng bộ.
5. **Lớp 5 - Kỹ năng mở rộng (MCP Tools / Skills)**: 40+ công cụ thực thi (tìm kiếm web, đọc/ghi file docx, xlsx, pptx qua PPTMaster, vẽ ảnh, quản lý nhóm).

---

## 2. BƯỚC 1: CHUẨN BỊ HẠ TẦNG VPS (UBUNTU 22.04 LTS)

### 2.1. Đăng ký gói VPS tối ưu

- **Nhà cung cấp**: VPS Bnix (https://my.bnix.one/aff.php?aff=246).
- **Gói khuyên dùng**: Gói quốc dân **Premium-4C** (giá ~999.000đ/12 tháng, ~83k/tháng).
  - Cấu hình: 4 vCPU Intel Xeon, 8GB RAM, 75GB SSD NVMe, băng thông không giới hạn, sao lưu tự động hàng tuần.
  - *Lưu ý quan trọng*: Luôn chọn dung lượng ổ từ 60GB trở lên để không bị tràn dung lượng khi kéo các image Docker và môi trường Python.

### 2.2. Khởi tạo môi trường trên VPS

Đăng nhập SSH vào VPS bằng quyền root:

```bash
# Cập nhật hệ thống
apt update && apt upgrade -y

# Cài đặt các công cụ nền tảng
apt install -y git curl wget unzip build-essential python3 python3-pip python3-venv

# Cài đặt Node.js v20 LTS và PM2
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs
npm install -g pm2

# Cài đặt Docker & Docker Compose (nếu muốn chạy container)
apt install -y docker.io docker-compose
systemctl enable --now docker
```

---

## 3. BƯỚC 2: CÀI ĐẶT CỔNG KẾT NỐI ZALO SIDECAR (2ANH-ZALO-BOT)

### 3.1. Tải mã nguồn

```bash
cd ~
git clone https://github.com/luonghaianh1208/2anh-zalo-bot.git
cd 2anh-zalo-bot
npm install
```

### 3.2. Cấu hình file .env tại thư mục 2anh-zalo-bot

Tạo và chỉnh sửa file `.env`:

```env
# Cổng WebSocket nội bộ để Hermes kết nối vào
ZALO_BRIDGE_PORT=3873

# Mã bí mật kết nối nội bộ giữa Sidecar và Hermes (tự sinh chuỗi ngẫu nhiên)
ZALO_BRIDGE_TOKEN=hermes_zalo_secret_token_2026

# Cổng giao diện Web xem QR đăng nhập
ZCA_PORT=3872

# Giãn nhịp gửi tin chống quét spam (mặc định 3000ms = 3 giây)
ZALO_RATE_INTERVAL_MS=3000

# Số tin nhắn tối đa gửi liên tục trước khi kích hoạt giãn nhịp
ZALO_RATE_BURST=5
```

### 3.3. Phương án khởi chạy Sidecar

#### PHƯƠNG ÁN A: Chạy trực tiếp qua PM2 (Khuyên dùng - Đơn giản, giữ session tuyệt đối)

```bash
# Khởi chạy sidecar qua PM2
pm2 start npm --name "zalo-sidecar" -- start

# Xem mã QR để quét đăng nhập bằng app Zalo trên điện thoại
pm2 logs zalo-sidecar

# Thiết lập tự khởi động cùng VPS khi reboot
pm2 startup
pm2 save
```

#### PHƯƠNG ÁN B: Đóng gói Docker (Nếu muốn đồng bộ container hóa)

Tạo file `Dockerfile` tại thư mục gốc `2anh-zalo-bot`:

```dockerfile
FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3872 3873
CMD ["npm", "start"]
```

Tạo file `docker-compose.yml`:

```yaml
version: '3.8'
services:
  zalo-sidecar:
    build: .
    container_name: zalo-sidecar
    restart: unless-stopped
    ports:
      - "3872:3872"
      - "3873:3873"
    volumes:
      # BẮT BUỘC MOUNT VOLUME ĐỂ KHÔNG MẤT COOKIE/SESSION KHI RESTART
      - ./data:/app/data
      - ./session:/app/session
      - ./.env:/app/.env
```

Chạy container:

```bash
docker-compose up -d
```

*Cách quét QR khi chạy Docker*: Mở trình duyệt truy cập `http://<IP-VPS>:3872` để quét mã QR.

---

## 4. BƯỚC 3: DỰNG BỘ NÃO HERMES AGENT & CẤU HÌNH PHÂN QUYỀN

### 4.1. Cài đặt Hermes Agent

```bash
cd ~
git clone https://github.com/nousresearch/hermes-agent.git
cd hermes-agent

# Tạo môi trường ảo Python
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -e .
```

### 4.2. Cấu hình biến môi trường Hermes (`~/.hermes/.env`)

Mở file `~/.hermes/.env` và thêm các biến phân quyền, bảo mật:

```env
# Kết nối về Zalo Sidecar
ZALO_BRIDGE_URL=ws://127.0.0.1:3873
ZALO_BRIDGE_TOKEN=hermes_zalo_secret_token_2026

# UID Zalo của chủ nhân (dãy số 17-21 chữ số, phân quyền Admin)
ZALO_ALLOWED_USERS=1234567890123456789

# Chỉ trả lời trong nhóm khi được @tag tên (chống spam nhóm)
ZALO_GROUP_REPLY_ONLY_TAGGED=true

# Mở cho mọi người trong nhóm chat cùng (false = chỉ admin)
ZALO_ALLOW_ALL_USERS=true

# Chính sách chat riêng 1-1 (owner-only = chỉ chủ bot được nhắn riêng)
ZALO_DM_POLICY=owner-only

# Khóa API Model AI
OPENROUTER_API_KEY=sk-or-v1-xxxxxxxxxxxx
GEMINI_API_KEY=AIzaSyxxxxxxxxxxxx
```

*Mẹo lấy UID Zalo*: Sau khi kết nối bot, dùng tài khoản Zalo cá nhân nhắn tin `/sethome` cho nick bot, hệ thống sẽ trả về chính xác chuỗi UID của bạn.

### 4.3. Cấu hình Model AI (`~/.hermes/config.yaml`)

Sử dụng cấu hình định tuyến thông minh:

```yaml
model:
  # Model mặc định: Gemini 1.5 Flash hoặc DeepSeek v4 Flash (nhẹ, nhanh, rẻ)
  default: openrouter/deepseek/deepseek-chat
  # Model khi cần suy luận sâu/code: Claude 3.5 Sonnet hoặc GPT-4o
  reasoning: openrouter/anthropic/claude-3.5-sonnet

agent:
  temperature: 0.7
  max_tokens: 4096
  system_prompt: |
    Bạn là trợ lý AI thông minh trên Zalo, phản hồi tự nhiên, chuẩn xác và thân thiện.
```

---

## 5. BƯỚC 4: CÀI ĐẶT TRÍ NHỚ DÀI HẠN OPENVIKING

### 5.1. Cài đặt OpenViking Server

Tách riêng môi trường cho OpenViking:

```bash
mkdir -p ~/openviking-server && cd ~/openviking-server
python3 -m venv venv
source venv/bin/activate
pip install openviking

# Khởi chạy server nền trên cổng 8000
nohup openviking-server --host 127.0.0.1 --port 8000 > openviking.log 2>&1 &
```

### 5.2. Kích hoạt OpenViking trên Hermes Agent

Quay lại môi trường Hermes:

```bash
cd ~/hermes-agent
source venv/bin/activate
hermes memory setup
```

- Chọn Provider: **OpenViking**
- Endpoint: `http://127.0.0.1:8000` (hoặc protocol `viking://local`)

### 5.3. Cơ chế hoạt động của OpenViking

- **Phân tầng L0/L1/L2**: L0 (tóm tắt cốt lõi) -> L1 (ngữ cảnh gần) -> L2 (toàn văn chi tiết). Chỉ tải dữ liệu sâu khi có câu hỏi liên quan, tiết kiệm 35% - 60% token đầu vào.
- **Trích xuất bất đồng bộ**: Khi kết thúc phiên trò chuyện, OpenViking tự động bóc tách thông tin cá nhân/sở thích lưu vào DB mà không làm trễ câu trả lời trên Zalo.

---

## 6. BƯỚC 5: TÍCH HỢP MCP TOOLS & VẬN HÀNH 24/7

### 6.1. Tích hợp công cụ tạo PowerPoint (PPTMaster)

Clone repo PPTMaster của thầy Lương Hải Anh:

```bash
cd ~
git clone https://github.com/luonghaianh1208/PPTmaster.git
cd PPTmaster
pip install -r requirements.txt
```

Khai báo tool PPTMaster vào danh mục công cụ trong file cấu hình MCP của Hermes (`~/.hermes/mcp_servers.yaml`).

### 6.2. Thiết lập chạy tự động 24/7 qua PM2

Tạo file khởi động `ecosystem.config.js` tại thư mục root VPS để quản lý toàn bộ dịch vụ:

```javascript
module.exports = {
  apps: [
    {
      name: "zalo-sidecar",
      cwd: "/root/2anh-zalo-bot",
      script: "npm",
      args: "start",
      restart_delay: 5000
    },
    {
      name: "openviking-server",
      cwd: "/root/openviking-server",
      script: "venv/bin/openviking-server",
      args: "--host 127.0.0.1 --port 8000",
      restart_delay: 5000
    },
    {
      name: "hermes-agent",
      cwd: "/root/hermes-agent",
      script: "venv/bin/hermes",
      args: "start",
      restart_delay: 5000
    }
  ]
};
```

Kích hoạt chạy tự động:

```bash
pm2 start ecosystem.config.js
pm2 save
pm2 startup
```

---

## 7. CẨM NANG XỬ LÝ SỰ CỐ (TROUBLESHOOTING)

1. **Lỗi mất phiên đăng nhập Zalo**: Do VPS bị đổi IP hoặc container Docker không mount volume. Luôn kiểm tra volume `./session` và giữ IP tĩnh. Phiên đăng nhập sẽ duy trì ổn định 15–30 ngày.
2. **Lỗi 429 Resource Exhausted (Gemini Pro)**: Do tài khoản Google AI Studio gói Free bị chạm trần 2–5 request/phút. Khắc phục bằng cách dùng Gemini 1.5 Flash làm default model và định kỳ gõ `/new` để dọn context.
3. **Zalo bị chặn gửi tin nhắn**: Đảm bảo `ZALO_RATE_INTERVAL_MS >= 3000` (trễ tối thiểu 3 giây giữa các tin) và bật `ZALO_GROUP_REPLY_ONLY_TAGGED=true`.
