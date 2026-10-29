---
title: "Sơ Đồ Phân Luồng Nhập Liệu Google Sheets - So Sánh 3 Phương Án"
source: ""
date_added: "2026-10-29"
type: "note"
tags: ["google-sheets", "apps-script", "appsheet", "google-form", "nhap-lieu", "tu-dong-hoa", "note"]
status: "raw"
---

# Sơ Đồ Phân Luồng Nhập Liệu Google Sheets

## SƠ ĐỒ PHÂN LUỒNG 3 PHƯƠNG ÁN ĐỒNG BỘ GOOGLE SHEETS
Giải pháp thu thập & cập nhật dữ liệu từ nhiều người dùng qua điện thoại di động.

---

## 📋 PHƯƠNG ÁN 1: GOOGLE FORM

**1. Thiết bị người dùng**
- Mở link Form trên trình duyệt điện thoại hoặc qua Zalo. Không cần đăng nhập Gmail.

**2. Thao tác nhập liệu**
- Điền các trường thông tin (Text, Số, Trắc nghiệm, Tải ảnh lên Drive). Bấm Gửi.

**3. Động cơ Google Forms**
- Google tự động xác thực dữ liệu và tạo dòng mới (Append row).

**4. Google Sheets trung tâm**
- Dữ liệu tức thì nhảy vào sheet "Form Responses". Tự động tính toán công thức.

**Ưu điểm**
- Cực dễ làm (5 phút), 100% miễn phí, chạy siêu nhẹ trên mọi điện thoại.

**Hạn chế**
- Chỉ thêm mới được, KHÔNG xem hay sửa được dữ liệu cũ đã gửi.

---

## 📱 PHƯƠNG ÁN 2: GOOGLE APPSHEET

**1. Thiết bị người dùng**
- Cài app AppSheet hoặc mở link PWA. Bắt buộc đăng nhập tài khoản Google.

**2. Thao tác tương tác**
- Giao diện app chuẩn di động: Xem danh sách, tìm kiếm, bấm nút Sửa, Quét mã QR, Chụp ảnh.

**3. Máy chủ AppSheet**
- Phân quyền xem theo email, kiểm tra điều kiện logic, lưu tạm offline nếu mất mạng.

**4. Google Sheets trung tâm**
- Đồng bộ hai chiều: Cập nhật đúng ô/dòng được sửa hoặc tạo thêm bản ghi mới.

**Ưu điểm**
- Giao diện app chuẩn chỉnh, xem & sửa dữ liệu cũ cực tốt, có quét mã QR.

**Hạn chế**
- Tối đa 10 người dùng bản Free, trên 10 người tính $5-$10/người/tháng.

---

## 🌐 PHƯƠNG ÁN 3: WEB APP (APPS SCRIPT)

**1. Thiết bị người dùng**
- Bấm vào link Web App duy nhất trong Zalo. Mở tức thì, không cần cài app, không cần đăng nhập.

**2. Giao diện Web tùy chỉnh**
- Hiển thị form nhập liệu hoặc bảng tra cứu tùy biến theo thương hiệu.

**3. Google Apps Script Backend**
- Hàm doPost() nhận JSON, kiểm tra tính hợp lệ dữ liệu, chạy script xử lý ngầm.

**4. Google Sheets trung tâm**
- Ghi thẳng vào Sheet qua SpreadsheetApp API. Tùy biến: thêm mới hoặc tra cứu sửa dòng cũ.

**Ưu điểm**
- Miễn phí 100%, không giới hạn người dùng, giao diện tùy biến tự do theo ý muốn.

**Hạn chế**
- Phải viết code HTML/JS (nhưng AI có thể viết sẵn 100% trong 2 phút).

---

## BẢNG ĐỐI CHIẾU TIỆN ÍCH 3 PHƯƠNG ÁN

**1. Chi phí sử dụng**
- Google Form: Miễn phí 100%
- AppSheet: Miễn phí ≤ 10 người ($5-$10/người/tháng)
- Web App (Apps Script): Miễn phí 100% vĩnh viễn

**2. Số lượng người nhập**
- Google Form: Không giới hạn
- AppSheet: Bị chặn hạn ngạch ở bản Free
- Web App: Không giới hạn người dùng

**3. Yêu cầu đăng nhập**
- Google Form: Tùy chọn (tắt được)
- AppSheet: Bắt buộc có tài khoản Gmail
- Web App: Hoàn toàn không cần đăng nhập

**4. Xem & Sửa dữ liệu cũ**
- Google Form: Không thể (chỉ ghi mới)
- AppSheet: Rất mạnh (sửa trực tiếp từng ô)
- Web App: Làm được (tùy biến theo code)

**5. Trải nghiệm trên điện thoại**
- Google Form: Trang form cuộn dọc
- AppSheet: Giao diện app native mượt mà
- Web App: Giao diện web di động linh hoạt

**6. Độ khó triển khai**
- Google Form: Rất dễ (tự kéo thả 5 phút)
- AppSheet: Dễ (Google tự sinh app)
- Web App: Nhờ AI viết code (khoảng 10 phút)

