---
title: "Hướng dẫn thiết kế Dashboard cho Zalo Bot"
source: ""
date_added: "2026-10-08"
type: "note"
tags: ["zalo-bot", "dashboard", "du-an", "kien-truc", "huong-dan", "note"]
status: "raw"
---

# Hướng dẫn thiết kế Dashboard cho Zalo Bot

## Mục tiêu
Biến bot Zalo từ "hộp đen" chạy ngầm thành trung tâm điều khiển trực quan: giám sát realtime, kiểm soát chi phí token, cảnh báo sự cố session Zalo.

## Kiến trúc
Zalo Bridge → Backend API (Node.js/FastAPI) → Database (SQLite/PostgreSQL) + AI Core + Frontend (React/Vue)

## 5 Phân hệ chức năng chính
1. Báo cáo & Đo lường KPI: tin nhận/gửi, lượt gọi AI, token, uptime, độ trễ + biểu đồ trực quan
2. Quản lý Phiên & Hạ tầng: trạng thái session Zalo, sức khỏe VPS (CPU/RAM/SSD), rate limiter
3. Nhật ký Kiểm tra: lịch sử chat, nhật ký gọi tool, log lỗi hệ thống
4. Can thiệp người thật (HITL): bật/tắt bot từng cuộc trò chuyện, allowlist/blocklist
5. Cấu hình Bot & Kho tri thức: sửa persona/prompt, quản lý tài liệu RAG

## Yêu cầu phi chức năng
- Realtime < 1 giây, tải trang < 2 giây
- Bảo mật: JWT + 2FA, IP Whitelist, mã hóa API Keys
- Responsive + Light/Dark mode

## Database (4 bảng chính)
- zalo_sessions
- audit_logs
- daily_metrics
- bot_settings

## Lộ trình 4 bước
1. Gắn middleware ghi log số liệu thô
2. Dựng Backend RESTful API
3. Phát triển Frontend UI (Tailwind + Recharts)
4. Tích hợp WebSocket + cảnh báo Telegram/Zalo
