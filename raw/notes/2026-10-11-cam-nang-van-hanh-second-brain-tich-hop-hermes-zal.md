---
title: "Cẩm nang vận hành Second Brain & Tích hợp Hermes Zalo Agent"
source: ""
date_added: "2026-10-11"
type: "note"
tags: ["second-brain", "hermes", "zalo-agent", "fts5", "git-sync", "sop", "kien-truc", "huong-dan", "note"]
status: "raw"
---

# CẨM NANG VẬN HÀNH SECOND BRAIN & TÍCH HỢP HERMES ZALO AGENT

## 1. KIẾN TRÚC LƯU TRỮ KÉP (DUAL-STORAGE)
- SQLite WAL (hermes.db): dữ liệu cấu trúc/tác vụ ngắn hạn — lịch hẹn, danh bạ, thu chi, phiên hội thoại.
- Obsidian Vault (D:\AI\Second Brain): tri thức dài hạn, Markdown thuần, hỗ trợ wikilink [[...]].
- Cấu trúc thư mục: raw/ (inbox, transcripts, articles/brag) → wiki/ → projects/ → _index.md.

## 2. ĐỘNG CƠ TÌM KIẾM FTS5
- Bảng ảo second_brain_fts gồm 3 trường: file_path, title, content.
- Tokenizer unicode61 — tìm tiếng Việt có dấu/không dấu hoàn hảo.
- CSDL tách riêng tại .hermes_index.db để tránh lock với hermes.db.
- Tự reindex khi khởi động bot + sau mỗi lần ghi bài; lệnh thủ công /reindex.
- Fallback an toàn: nếu FTS5 chưa tạo → tự quét rglob truyền thống.

## 3. ĐỒNG BỘ GIT AN TOÀN (Safe Git Sync)
- Chu trình: commit cục bộ → fetch → pull --rebase --autostash → push.
- Gặp xung đột: rebase --abort → stash pop → trả success: False, không chèn thẻ conflict, không sập bot.

## 4. 3 ĐIỀU KIỆN ĐỂ BOT TỰ TRUY XUẤT TRI THỨC
- Khai báo Tool Description rõ ràng trong hermes_brain.py.
- Thêm nguyên tắc + Few-shot vào System Prompt (bắt buộc gọi search_second_brain trước khi trả lời).
- Cơ chế Pre-retrieval/Auto RAG: chạy ngầm FTS5 trước khi sinh câu trả lời.

## 5. SOP VẬN HÀNH HIỆU QUẢ
- Ghi chú nguyên tử: mỗi file giải quyết trọn 1 vấn đề.
- Tiêu đề hành động: cach-fix-timeout-180s-zalo-gateway.md (tránh zalo.md, loi.md).
- YAML Frontmatter chuẩn: title, date, tags, summary.
- Thu nạp 1 chạm qua Zalo: "Lưu ghi chú: ..." → raw/inbox/; nguyên tắc "thu nạp trước, phân loại sau".

## 6. 3 KỊCH BẢN THỰC CHIẾN
- Troubleshooting Log — nhật ký xử lý sự cố.
- Brag Document — nhật ký thành tựu công việc (raw/articles/brag/).
- Cross-referencing — khai thác tri thức chéo giữa các dự án.

## 7. VÒNG ĐỜI TRI THỨC
- Việc vặt 1 lần → SQLite, không lưu Markdown.
- Tiến hóa: raw/inbox → wiki → projects → Archive.
