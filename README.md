# SauceDemo-UI-Automation
This project demonstrates **UI automation testing** of the [SauceDemo](https://www.saucedemo.com/) using the **Robot Framework**, in order to practice my automation testing skills with focus on functional testing using Page Object Model (POM) structure.

## 📌 Inspiration and personal purpose
An automation testing project written with Robot Framework. It was developed in order to understand better how Robot Framework functions work and to developed an End-to-end user flow on the demo shopping [SauceDemo](https://www.saucedemo.com/) website, where I tested more functionalities and details.

## 📚 Documentation (Google Docs & Sheets)
- 📄 [Test Plan (Google Docs)](https://docs.google.com/document/...)  
- 🧪 [Test Cases (Google Sheets)](https://docs.google.com/spreadsheets/...)  
- 🐞 [Bug Report (PDF - Jira Export)](https://drive.google.com/file/d/...) 
- ✅ [Test Summary Report (Google Docs)](https://docs.google.com/document/...)

📁 View all documentation in this shared folder: [Google Drive Folder](https://drive.google.com/drive/folders/...)

## 🧪 Test Scope
### ✅ In Scope
- Functional UI testing of standard user workflows on https://www.saucedemo.com
    - Login & Logout functionality
    - Product listing and sorting
    - Add to cart and remove items
    - Cart page operations
    - Checkout process
- Validation of form input errors (e.g., empty fields, invalid ZIP code)
- Basic UI element presence and visibility checks

### ❌ Out of Scope
- Backend API validation (not covered in this UI-only project)
- Performance or load testing
- Mobile responsiveness or device testing
- Security testing (e.g., SQL injection, XSS)
- Testing with multiple user roles (only standard user tested)


## ▶️ How to Run Tests

### 🛠️ Prerequisites
Ensure you have the following installed on your system:
- Python (version 3.8+ recommended) 👉 Download: https://www.python.org/downloads/
- pip (usually comes with Python)
- Google Chrome (for browser testing)
- ChromeDriver
    - Make sure the version matches your installed Chrome browser 👉 Download: https://chromedriver.chromium.org/downloads

### 📦 Install Dependencies
Install Robot Framework and necessary libraries via pip:
``` bash 
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-screencaplibrary
```

### 🚀 Run the Tests
Clone the repository and navigate into it:
``` bash 
git clone https://github.com/yourusername/saucedemo-tests.git
cd saucedemo-tests
```
Run tests and store the output in the `results` folder:
``` bash 
 robot --outputdir ./results testcases/saucedemo_test.robot
```
The test report will be generated in: `results\report.html`


<!-- 🧪 รายการที่ทดสอบ Core Flow
1. 🔐 Authentication (การเข้าสู่ระบบ)
- Login: username/password ถูกต้อง
- Login: username/password ไม่ถูกต้อง
- Login: ฟอร์มว่าง หรือใส่ไม่ครบ
2. 🧭 Logout
- เปิด/ปิดเมนูซ้าย
- กด Logout จากเมนู
3. 🛒 Inventory Page (หน้าสินค้า)
- ตรวจสอบว่ารายการสินค้าถูกโหลด
- เรียงสินค้าจากราคาต่ำ-สูง
- เรียงสินค้าจากราคาสูง-ต่ำ
- เรียงสินค้าจากชื่อ A-Z
- เรียงสินค้าจากชื่อ Z-A
- ไปยังหน้ารายละเอียดของสินค้า
- กด Back จากรายละเอียดกลับมา
4. ➕➖ Add to Cart / Remove
- Add 1 สินค้าไปยังตะกร้า
- Add หลายสินค้า
- Remove สินค้าจาก Inventory page
- ตรวจสอบ badge ของตะกร้าเปลี่ยนตามจำนวน
5. 🧺 Cart Page (หน้าตะกร้า)
- ตรวจสอบรายการในตะกร้า
- Remove สินค้าจากตะกร้า
- กด Continue Shopping
- กด Checkout
6. 💳 Checkout Page (การชำระเงิน)
- Step 1: ฟอร์มไม่ครบ → แสดง error
- Step 1: ใส่ข้อมูล Zip เป็นตัวอักษร → แสดง error
- Step 1: ใส่ข้อมูล (ชื่อ, นามสกุล, Zip)
- Step 2: ตรวจสอบข้อมูลสินค้า & กด Finish
- Step 3: ข้อความสรุป & กลับหน้าแรก -->