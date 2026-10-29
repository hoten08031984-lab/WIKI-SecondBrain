---
title: "Phân tích 3 phương án nhập liệu Google Sheets từ điện thoại (Form - AppSheet - Web App)"
source: ""
date_added: "2026-10-29"
type: "note"
tags: ["google-sheets", "apps-script", "appsheet", "google-form", "tu-dong-hoa", "wiki", "note"]
status: "raw"
---

## Sơ đồ luồng hoạt động

### 1. Google Form
- Người dùng bấm link Form trên điện thoại (qua Zalo hoặc trình duyệt).
- Nhập thông tin và bấm Gửi, không bắt buộc đăng nhập Gmail.
- Dữ liệu tự động đẩy thành một dòng mới vào Google Sheet theo thời gian thực.

### 2. Google AppSheet
- Người dùng mở ứng dụng AppSheet trên điện thoại (bắt buộc đăng nhập Gmail).
- Xem danh sách dữ liệu, tìm kiếm, thêm mới hoặc sửa trực tiếp từng dòng.
- Máy chủ AppSheet xác thực phân quyền và đồng bộ hai chiều vào Google Sheet.

### 3. Web App (Apps Script)
- Người dùng bấm đường link Web App duy nhất (mở mượt ngay trong Zalo).
- Giao diện web hiển thị form nhập liệu hoặc bảng tra cứu thiết kế riêng.
- Mã Apps Script tiếp nhận dữ liệu và ghi thẳng vào Google Sheet trung tâm.

## Ưu điểm và hạn chế

### 1. Google Form
- Ưu điểm: Dễ làm nhất, chỉ 5 phút kéo thả là dùng được ngay.
- Trải nghiệm di động: Giao diện nhẹ, mở tức thì, người điền không cần tài khoản, không cần cài đặt.
- Chi phí: Miễn phí hoàn toàn, không giới hạn số lượng người gửi.
- Hạn chế: Dữ liệu chỉ đi một chiều (chỉ thêm mới), không xem lại danh sách hay sửa thông tin cũ trên Sheet.

### 2. Google AppSheet
- Ưu điểm: Trải nghiệm như ứng dụng chuyên nghiệp, hỗ trợ tìm kiếm, lọc, sửa dữ liệu cũ, chụp ảnh, quét mã QR.
- Trải nghiệm di động: Thao tác mượt, hỗ trợ lưu tạm khi mất mạng (offline mode).
- Hạn chế: Bản miễn phí tối đa 10 người dùng thử. Vượt quá sẽ tốn 5-10 USD/người/tháng và bắt buộc mỗi người phải có Gmail.

### 3. Web App (Apps Script)
- Ưu điểm: Linh hoạt tuyệt đối, miễn phí 100% vĩnh viễn, không giới hạn số người truy cập.
- Trải nghiệm di động: Tùy biến giao diện theo kích thước màn hình điện thoại, mở trực tiếp không cần đăng nhập.
- Khả năng xử lý: Vừa thêm dòng mới, vừa tra cứu và sửa dòng cũ theo mã định danh.
- Hạn chế: Phải viết mã HTML/Apps Script (có thể nhờ Antigravity hoặc Claude Code viết trọn bộ trong vài phút).

## Kết luận & gợi ý lựa chọn
- Cần nhập nhanh, một chiều, miễn phí, không ràng buộc tài khoản → chọn Google Form.
- Cần ứng dụng chuyên nghiệp, sửa/xóa/tìm kiếm dữ liệu, chụp ảnh, quét QR, số người dùng ít → chọn AppSheet.
- Cần miễn phí vĩnh viễn, không giới hạn người dùng, vừa nhập vừa tra cứu/sửa, mở mượt trong Zalo → chọn Web App (Apps Script) là tối ưu nhất, chỉ tốn công viết mã một lần.
