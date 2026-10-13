# 🎬 CẨM NANG TOÀN TẬP: HƯỚNG DẪN SỬ DỤNG & TÙY CHỈNH SKILL BRAG (HYPERFRAMES)

Tài liệu hướng dẫn chi tiết toàn bộ các thông số kỹ thuật, cờ lệnh, âm thanh, giọng đọc và phong cách nghệ thuật khi tạo video tự động bằng **Skill Brag** trên **Antigravity IDE**.

---

## 📖 MỤC LỤC
1. [Tổng Quan Về Skill Brag](#1-tổng-quan-về-skill-brag)
2. [Bảng Tra Cứu Cờ Lệnh (Command Flags)](#2-bảng-tra-cứu-cờ-lệnh-command-flags)
3. [Tùy Chỉnh 7 Phong Cách Nghệ Thuật (Tone Presets)](#3-tùy-chỉnh-7-phong-cách-nghệ-thuật-tone-presets)
4. [Hệ Thống Âm Nhạc & Nhịp Beat (Music & Beat Sync)](#4-hệ-thống-âm-nhạc--nhịp-beat-music--beat-sync)
5. [Hệ Thống Giọng Đọc Thuyết Minh (Voiceover / TTS)](#5-hệ-thống-giọng-đọc-thuyết-minh-voiceover--tts)
6. [Kho Hiệu Ứng Âm Thanh SFX (100+ Mẫu CC0)](#6-kho-hiệu-ứng-âm-thanh-sfx-100-mẫu-cc0)
7. [Tỷ Lệ Khung Hình & Độ Phân Giải (Aspect Ratios)](#7-tỷ-lệ-khung-hình--độ-phân-giải-aspect-ratios)
8. [Cấu Trúc Thư Mục Thành Phẩm](#8-cấu-trúc-thư-mục-thành-phẩm)
9. [Các Câu Lệnh Mẫu Thực Tế](#9-các-câu-lệnh-mẫu-thực-tế)

---

## 1. Tổng Quan Về Skill Brag

* **Mục đích:** Tự động chuyển đổi source code dự án hoặc đường link website thành **video giới thiệu / phóng sự ngắn chuyên nghiệp** (~15s – 25s) có animation mượt mà, khớp nhạc nền, hiệu ứng âm thanh và giọng đọc.
* **Engine dựng hình:** **Hyperframes** (kết hợp HTML5/CSS3, GSAP animation và Headless Chrome) xuất video MP4 sắc nét từng khung hình.
* **Đặc điểm nổi bật:**
  * Đọc trực tiếp code/giao diện thật, không dùng ảnh chụp phẳng hay template giả tạo.
  * Tự động kiểm tra độ tương phản màu chuẩn quốc tế (WCAG AA).
  * Đồng bộ chuyển động thị giác khớp đúng từng nhịp phách âm thanh (*Beat Locking*).

---

## 2. Bảng Tra Cứu Cờ Lệnh (Command Flags)

Khi gọi lệnh `/brag`, có thể kết hợp các cờ lệnh sau:

| Cờ Lệnh (Flag) | Giá Trị Khả Dụng | Mặc Định | Mô Tả & Tác Dụng |
|---|---|---|---|
| `--tone` | `default`, `polished`, `yc-parody`, `chaotic`, `deadpan`, `cinematic`, `app-store` hoặc câu tự do (*freeform*) | Tự động nhận diện | Quyết định phong cách nghệ thuật, nhịp độ cắt cảnh và năng lượng của video. |
| `--format` | `landscape`, `vertical`, `square` | `landscape` | **Tỷ lệ khung hình:** Ngang 16:9 (Youtube), Dọc 9:16 (TikTok/Reels/Shorts), Vuông 1:1 (Facebook Post). |
| `--duration` | Số giây (ví dụ: `15`, `18.5`, `25`) | Auto (~18s - 22s) | Tổng thời lượng video. |
| `--voice` | Không cần tham số (chỉ gắn cờ) | Tắt | Bật tính năng tạo lời bình thuyết minh lồng tiếng. |
| `--no-music` | Không cần tham số | Nhạc bật | Tắt toàn bộ nhạc nền (chỉ giữ lại hiệu ứng âm thanh SFX hoặc yên tĩnh). |
| `--no-sfx` | Không cần tham số | SFX bật | Tắt toàn bộ tiếng động hiệu ứng (click, va chạm, gõ phím). |
| `--title` | Chuỗi văn bản (ví dụ: `--title "Tên Dự Án"`) | Tự động trích xuất | Đặt tiêu đề hiển thị chính trên video. |

---

## 3. Tùy Chỉnh 7 Phong Cách Nghệ Thuật (Tone Presets)

Mỗi phong cách sẽ tự động điều chỉnh typography, hiệu ứng chuyển cảnh, tốc độ cắt và âm thanh:

### 3.1. `cinematic` (Điện Ảnh, Trailer Kịch Tính)
* **Cảm xúc:** Hùng tráng, cuốn hút, quy mô trailer phim.
* **Pacing:** 3 – 5 phân cảnh, giữ khung hình lâu (4s – 6s) với các cú zoom chậm (*slow pan/zoom*).
* **Âm thanh:** Âm bass sâu (*sub-bass*), tiếng chuông ngân trầm (*heavy bell impact*).
* **Phù hợp:** Phóng sự điều tra, tin bão lũ khẩn cấp, dự án công nghệ mang tính đột phá.

### 3.2. `chaotic` / `vortex` (Dồn Dập, Khẩn Cấp, Bão Lốc)
* **Cảm xúc:** Nhanh, gấp gáp, chữ in hoa giật chớp (*kinetic typography*).
* **Pacing:** 6 – 8 phân cảnh ngắn (1.5s – 2.5s), chuyển cảnh rung chấn, xoáy nước (*vortex rotation/flash cuts*).
* **Âm thanh:** Mật độ SFX dày đặc, tiếng đấm, tiếng va chạm kim loại dồn dập.
* **Phù hợp:** Cảnh báo thiên tai, tin nóng khẩn, video quảng cáo game hành động.

### 3.3. `polished` (Sang Trọng, Tinh Tế, Đẳng Cấp)
* **Cảm xúc:** Tối giản, thanh lịch, phong cách thiết kế của Apple.
* **Pacing:** 3 – 4 phân cảnh, chữ mảnh (*light weight*), khoảng trắng thoáng rộng, chuyển cảnh mờ mượt (*soft fade* 0.6s – 0.8s).
* **Âm thanh:** Rất ít SFX, chỉ 2-3 tiếng chạm nhẹ tinh tế (`drop_001`, `bong_001`).
* **Phù hợp:** Sản phẩm tài chính, SaaS doanh nghiệp lớn, ứng dụng thiết kế cao cấp.

### 3.4. `yc-parody` (Khởi Nghiệp Công Nghệ, Deadpan Startup)
* **Cảm xúc:** Giọng điệu nghiêm túc nhưng nội dung hài hước châm biếm, dẫn dắt câu chuyện như buổi gọi vốn Y-Combinator.
* **Pacing:** 4 – 5 phân cảnh, mỗi cảnh nêu 1 luận điểm/con số ấn tượng, chuyển cảnh cắt cụt dứt khoát (*hard cuts* 0.2s).
* **Phù hợp:** Sản phẩm công nghệ cá nhân, tool mã nguồn mở, dự án hackathon.

### 3.5. `app-store` (Giới Thiệu Tính Năng, Clean Cards)
* **Cảm xúc:** Thân thiện, bắt mắt, thẻ tính năng trượt ngang mượt mà.
* **Pacing:** 4 – 6 phân cảnh, chữ rõ ràng, âm thanh lướt thẻ bài (*card-slide*).
* **Phù hợp:** Ứng dụng di động, Web Dashboard, hệ thống ERP / CRM.

### 3.6. `deadpan` (Tối Giản, Bình Thản)
* **Cảm xúc:** Tĩnh lặng, không phô trương, sự hài hước đến từ chính sự thật thà.
* **Pacing:** 3 – 4 phân cảnh, khoảng trống lớn, chuyển cảnh chậm rãi.

### 3.7. `default` (Vui Vẻ, Hiện Đại, Dễ Lan Tỏa)
* **Cảm xúc:** Tươi sáng, sắc nét, cân bằng hoàn hảo cho mọi nội dung đại chúng.

---

## 4. Hệ Thống Âm Nhạc & Nhịp Beat (Music & Beat Sync)

### 4.1. Kho Nhạc Nền Tích Hợp Sẵn (CC0 Commercial License)
Nằm tại thư mục: `~/.gemini/config/skills/brag/assets/music/`
* `happy-beats-business-moves-vol-1.mp3`: Tiết tấu vừa, vui vẻ, thân thiện.
* `happy-beats-business-moves-vol-9.mp3`: Năng động, nhịp nhàng.
* `happy-beats-business-moves-vol-11.mp3`: Dồn dập, tiết tấu nhanh, hồi hộp, kịch tính.
* `happy-beats-business-moves-vol-12.mp3`: Hiện đại, phong cách nhạc điện tử công nghệ cao.

> **Dùng nhạc riêng của Sếp:**
> Chỉ cần sao chép file `.mp3` bất kỳ vào thư mục `assets/music/bgm.mp3` của dự án là video sẽ tự động chạy theo bài hát đó.

### 4.2. Khóa Nhịp Beat (Beat Locking)
* Hyperframes tự động phân tích phổ âm thanh và các điểm dập phách (*transients/beats*).
* Chuyển cảnh chính (*major reveals*) được tự động căn chỉnh hút về điểm beat gần nhất (sai số chỉ **±0.15s**), giúp hình ảnh đổi cảnh đúng cú đập trống.

### 4.3. Hiệu Ứng Thở Theo Nhạc (Audio-Reactive)
* Biên độ năng lượng bass (*RMS*) được ánh xạ trực tiếp vào CSS:
  * Vòng sáng (*glow*) hoặc độ nở nhẹ của card sản phẩm phồng lên theo tiếng trống.
  * Tốc độ xoáy hoặc độ rung chấn của luồng nước chuyển động theo nhịp điệu.

---

## 5. Hệ Thống Giọng Đọc Thuyết Minh (Voiceover / TTS)

### 5.1. Giọng Đọc Tiếng Việt (Edge Neural TTS - Chuẩn Phát Thanh Viên)
Công cụ AI đọc tiếng Việt tự nhiên 100%, không bị máy móc:

| Giọng Đọc | Giới Tính | Đặc Điểm | Tình Huống Sử Dụng |
|---|---|---|---|
| **`vi-VN-HoaiMyNeural`** | Nữ | Truyền cảm, trong trẻo, lưu loát | Bản tin thời sự, phóng sự xã hội, review sản phẩm, thương mại. |
| **`vi-VN-NamMinhNeural`** | Nam | Trầm ấm, đanh thép, bản lĩnh | Tin tức khẩn cấp, giới thiệu công nghệ, thể thao, trailer hành động. |

* **Tốc độ đọc (`rate`):**
  * `rate="+0%"`: Tốc độ đàm thoại bình thường.
  * `rate="+15%"` hoặc `rate="+20%"`: Nhịp dồn dập cho tin khẩn cấp, bản tin 60 giây.
  * `rate="-10%"`: Trầm ngâm, sâu lắng.

### 5.2. Giọng Đọc Quốc Tế (Kokoro-82M Cục Bộ)
* **Tiếng Anh (US):** `af_heart` (Nữ ấm áp), `af_nova`, `af_sky`, `am_adam` (Nam), `am_michael`.
* **Tiếng Anh (UK):** `bf_emma` (Nữ quý phái), `bm_george` (Nam).
* **Đa ngôn ngữ khác:** Tiếng Nhật (`jf_alpha`), tiếng Pháp (`ff_siwis`), tiếng Trung (`zf_xiaobei`), tiếng Tây Ban Nha (`ef_dora`).

### 5.3. Tự Động Giảm Nhạc Nền (Audio Ducking)
* Khi giọng đọc cất lên: Âm lượng nhạc nền tự động ép nhỏ xuống mức **`0.15 – 0.20`** để giọng nói nổi bật và rõ ràng nhất.
* Khi kết thúc câu thoại: Nhạc nền tự động đẩy mạnh lên **`0.40 – 0.85`** để tạo cao trào bùng nổ ở phần outro.

---

## 6. Kho Hiệu Ứng Âm Thanh SFX (100+ Mẫu CC0)

Nằm tại thư mục: `~/.gemini/config/skills/brag/assets/sfx/`

| Nhóm Thư Mục | Tên Mẫu Tiêu Biểu | Mục Đích Sử Dụng |
|---|---|---|
| **`impact/`** | `impactBell_heavy_000`, `impactSoft_medium`, `impactPunch`, `impactMetal` | Cú dập khi xuất hiện tiêu đề lớn, chuyển cảnh bão lũ, logo xuất hiện cuối video. |
| **`interface/`** | `click_001-005`, `glitch_002`, `drop_001`, `switch_001` | Tiếng click chuột mô phỏng, tiếng lỗi kỹ thuật số, tiếng thả card tính năng. |
| **`keyboard/`** | 32 mẫu gõ phím cơ rời (`keypress-001.wav` đến `032.wav`) | Âm thanh gõ từng ký tự chân thật khi có animation đánh máy (*typewriter*). |
| **`casino/`** | `card-slide`, `chips-stack`, `cards-pack-open` | Tiếng lướt thẻ bài, tăng số nhảy số đếm (*counter*), mở hộp tính năng. |
| **`ui/`** | `mouseclick1`, `rollover1`, `switch1-38` | Tiếng rê chuột (*hover*), tiếng bật tắt công tắc nhẹ nhàng. |

---

## 7. Tỷ Lệ Khung Hình & Độ Phân Giải (Aspect Ratios)

| Tên Khung Hình | Độ Phân Giải | Tỷ Lệ | Nền Tảng Khuyên Dùng |
|---|---|---|---|
| **`landscape`** | **1920 × 1080** *(hoặc 4K 3840×2160)* | **16:9** | YouTube, Website, Trình chiếu màn hình TV, X (Twitter). |
| **`vertical`** | **1080 × 1920** *(hoặc 4K 2160×3840)* | **9:16** | TikTok, Facebook Reels, Instagram Reels, YouTube Shorts. |
| **`square`** | **1080 × 1080** *(hoặc 4K 2160×2160)* | **1:1** | Bài viết Facebook Feed, Instagram Post, LinkedIn Feed. |

* **Tốc độ khung hình:** 30fps (chuẩn mượt) hoặc 60fps.

---

## 8. Cấu Trúc Thư Mục Thành Phẩm

Mỗi lần chạy lệnh `/brag`, một thư mục dự án được sinh ra với cấu trúc chuẩn:

```text
vne-vortex-brag/
├── assets/
│   ├── images/              # Ảnh trích xuất từ bài báo / web
│   ├── music/
│   │   └── bgm.mp3          # Nhạc nền đã chọn
│   ├── sfx/                 # Hiệu ứng âm thanh va chạm, click
│   └── voiceover.mp3        # File giọng đọc thuyết minh AI
├── brag-plan.md             # Bản kế hoạch kịch bản storyboard chi tiết từng giây
├── composition-brief.md     # Định hướng nghệ thuật & màu sắc
├── hyperframes.json         # File cấu hình engine Hyperframes
├── index.html               # File mã nguồn video chính (HTML5 + GSAP animation)
├── share-copy.txt           # Đoạn văn bản mẫu soạn sẵn để đăng mạng xã hội kèm video
├── brag.jpg                 # Ảnh Poster Thumbnail trích xuất từ khung hình đẹp nhất
└── brag.mp4                 # Video thành phẩm xuất sắc Full HD
```

---

## 9. Các Câu Lệnh Mẫu Thực Tế

Sếp chỉ cần copy hoặc điều chỉnh theo nhu cầu:

1. **Làm video phóng sự thời sự dồn dập:**
   ```text
   /brag https://vnexpress.net/... --tone chaotic --format landscape --duration 19 --voice
   ```
2. **Làm video TikTok dọc giới thiệu web app:**
   ```text
   /brag --format vertical --tone app-store --duration 20 --voice
   ```
   *(Lời thoại: "Giới thiệu Web Dashboard báo cáo tự động...")*
3. **Làm video phong cách điện ảnh trailer sang trọng:**
   ```text
   /brag https://mywebsite.com --tone cinematic --format landscape --no-sfx
   ```
4. **Làm video vuông Facebook Feed hài hước, khởi nghiệp:**
   ```text
   /brag --format square --tone yc-parody --duration 15
   ```
5. **Ra lệnh bằng tiếng Việt tự nhiên với Em:**
   * *"Làm video dọc 20 giây đăng Reels, phong cách bão lũ Vortex, giọng nữ Hoài My"*
   * *"Đổi nhạc nền sang bài vol-12 công nghệ và tắt âm thanh va chạm sfx"*
   * *"Render lại video với giọng nam Nam Minh đanh thép"*

---
*Tài liệu được biên soạn và lưu trữ tại hệ thống Antigravity IDE.*
