---
title: "Hướng dẫn thiết kế Dashboard cho Zalo Bot"
source: ""
date_added: "2026-10-11"
type: "note"
tags: ["zalo-bot", "dashboard", "kien-truc", "du-an", "fullstack", "note"]
status: "raw"
---

# Hướng dẫn thiết kế Dashboard cho Zalo Bot

## Mục tiêu cốt lõi
- Biến bot Zalo từ "hộp đen" chạy ngầm trên VPS thành trung tâm điều khiển trực quan
- Giám sát ổn định, kiểm soát chi phí token AI, phát hiện sự cố session Zalo kịp thời
- Hỗ trợ can thiệp người thật (Human-in-the-loop) khi bot gặp tình huống phức tạp

## Kiến trúc & Công nghệ
- Backend: Node.js (Express/Fastify) hoặc Python (FastAPI)
- Database: SQLite (< 10.000 tin/ngày) hoặc PostgreSQL (mở rộng đa tài khoản)
- Realtime: Redis + WebSocket (Socket.io)
- Frontend: React/Next.js/Vue (Web) hoặc Flutter/React Native (Mobile)

## 5 phân hệ chức năng chính
- Báo cáo & Đo lường: KPI (tin nhận, tin trả lời, lượt gọi AI, token, uptime, độ trễ) + biểu đồ cột/đường
- Quản lý Phiên Zalo & Hạ tầng: Trạng thái session (Online/Disconnected/Pending QR), CPU/RAM/SSD, rate limiter
- Nhật ký Kiểm tra: Lịch sử hội thoại, nhật ký gọi tool (input/output), log lỗi hệ thống
- Can thiệp người thật (HITL): Bật/tắt bot từng cuộc trò chuyện, allowlist/blocklist
- Cấu hình Bot & Kho tri thức: Sửa persona/system prompt, quản lý tài liệu RAG

## Yêu cầu phi chức năng
- Realtime độ trễ < 1 giây, tải trang lần đầu < 2 giây
- Bảo mật: JWT + 2FA, IP Whitelist/Cloudflare/VPN, mã hóa API Keys & Session Tokens
- UX/UI: Responsive (Desktop + Mobile), hỗ trợ Light/Dark mode

## Database Schema (4 bảng)
- zalo_sessions - trạng thái tài khoản/session Zalo
- audit_logs - nhật ký tin nhắn & kiểm toán (token, latency, tools_called, hitl_status)
- daily_metrics - tổng hợp số liệu theo ngày (inbound, outbound, tokens, cost, uptime)
- bot_settings - cấu hình hệ thống

## Lộ trình 4 bước
- Bước 1: Gắn middleware ghi log số liệu thô vào DB
- Bước 2: Dựng Backend API (metrics/overview, sessions/status, logs, hitl/toggle)
- Bước 3: Phát triển Frontend UI (Tailwind/Shadcn/Ant Design + Recharts/Chart.js)
- Bước 4: Tích hợp WebSocket + cảnh báo đẩy qua Telegram/Zalo khi sự cố
