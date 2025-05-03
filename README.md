# SauceDemo-UI-Automation
This project demonstrates **UI automation testing** of the [SauceDemo](https://www.saucedemo.com/) using the **Robot Framework**, in order to practice my automation testing skills with focus on functional testing using Page Object Model (POM) structure.

## 📌 Inspiration and personal purpose
An automation testing project written with Robot Framework. It was developed in order to understand better how Robot Framework functions work on the demo shopping [SauceDemo](https://www.saucedemo.com/) website, where I tested more functionalities and details.

## 📚 Documentation (Google Docs & Sheets)
- 📄 [Test Plan (Google Docs)](https://docs.google.com/document/d/1-lrxU39OmO9sJA6JqrUbi1nZc17gsmUTm-WPx2iO84A/edit?usp=sharing)  
- 🧪 [Test Cases (Google Sheets)](https://docs.google.com/spreadsheets/d/1lHwW3PfNL1AI9RI9j7cxp2SzekNTmACaPHAcs8CnecI/edit?usp=sharing)  
- 🐞 [Bug Report (PDF - Jira Export)](https://drive.google.com/file/d/1q12WxJQ_sewGhepSxken8R2atcZ5EcXv/view?usp=sharing)
- ✅ [Test Summary Report (Google Docs)](https://docs.google.com/document/d/1pLT3RmXAhAUQpnUe3j_ad7KnZfDQVVMengIbv9skDAw/edit?usp=sharing)

📁 View all documentation in this shared folder: [Google Drive Folder](https://drive.google.com/drive/folders/12xwMVhaA6jwB8pNXFYAVQR4Kj6c2Yn_j?usp=sharing)

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

## 🎬 video of the Automation test
video recording of the automation tests execution
https://github.com/user-attachments/assets/4008235a-cf48-4b6e-93b2-eebfa6aed69a

## ▶️ How to Run Tests

### 🛠️ Prerequisites
Ensure you have the following installed on your system:
- Python (version 3.8+ recommended) 👉 [Download](https://www.python.org/downloads/)
- pip (usually comes with Python)
- Google Chrome (for browser testing)
- ChromeDriver
    - Make sure the version matches your installed Chrome browser 👉 [Download](https://chromedriver.chromium.org/downloads)

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
