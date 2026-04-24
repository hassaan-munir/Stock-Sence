# 🚀 StockSense – AI Powered Inventory Management System

StockSense is a production-oriented Inventory Management System built using a hybrid low-code and no-code architecture. The system integrates workflow automation, a relational database, and an AI-powered chatbot to create a smart, scalable, and real-world business solution.

---

## 📌 Overview

StockSense is designed to simulate a real-world inventory system where users can:

* Manage products and stock
* Track sales and refunds
* Perform real-time inventory operations
* Interact with the system using an AI chatbot

The project combines automation, structured data handling, and intelligent interaction into a single platform.

---

## 🏗️ Tech Stack

**Frontend**

* HTML, CSS, JavaScript
* Progressive Web App (PWA)

**Backend**

* n8n (Workflow Automation)

**Database**

* MySQL

**AI Layer**

* Multiple LLM integrations (Chatbot Agent)

**Deployment**

* Local hosting (n8n)
* Public exposure via tunneling
* GitHub for frontend hosting

---

## 🤖 AI Chatbot (Key Feature)

The system includes an AI-powered chatbot that can:

* Perform inventory operations
* Fetch and display data
* Execute commands using natural language

### ⚠️ Known Issue (Important)

Due to LLM limitations:

* The chatbot may hit TPM (Tokens Per Minute) limits quickly
* In some cases:

  * ✅ Action is successfully performed in the backend
  * ❌ Response is not generated

👉 This results in **"undefined" response on frontend**, even though the operation has already been executed successfully.

📌 **Important Clarification:**

* This issue exists **only in the chatbot agent**
* The **manual Inventory Management System works perfectly without any issues**

---

## 🔐 Security Features

* JWT-based authentication
* Password hashing
* Store-level data isolation
* Secure workflow execution

---

## 🌐 Live Demo

👉 **Live Demo Link:** *(Add your link here)*

⚠️ Note:
The backend server is hosted locally and may not always be active.

👉 If you want a **live demo or full experience**, please contact me directly so I can activate the server.

---

## 📦 Features

* Full Inventory Management System
* Sales and Refund Handling
* AI-based Interaction
* Real-time Data Processing
* Installable Web App (PWA)

---

## ⚙️ Deployment Note

* Backend runs locally via n8n
* Public access is enabled when server is active
* Requires manual startup

---

## 🚧 Limitations

* LLM rate limits (TPM issue)
* Chatbot response failures (occasionally)
* Dependency on external AI APIs
* Backend not always active

---

## 🔮 Future Improvements

* Cloud-based deployment
* Queue system for LLM requests
* Improved response handling
* Better fault tolerance

---

## 📬 Contact

If you want a live walkthrough, demo, or explanation of the system:

👉 Feel free to reach out and request a live session.

---

## ⭐ Final Note

This project demonstrates how a production-grade system can be built using low-code tools combined with AI. It reflects real-world challenges, engineering decisions, and system design thinking.
