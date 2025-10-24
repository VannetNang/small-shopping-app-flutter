# 👟 Shoes Shopping App

A simple Flutter shopping app where users can **browse shoes**, **filter by brand**, and **add items to cart**.  
This project focuses on **UI & state management** — no backend or payment integration.

---

## 🧭 Features

- 🛍 **Browse Products** — View a list of shoes with name, price, and image  
- 🧢 **Brand Filter** — Filter products by brand (e.g., Nike, Adidas, Puma)  
- 🛒 **Shopping Cart** — Add and remove products, view total price  
- 💳 **Checkout UI** — Simple form (no payment, just UI)  
- 🌗 **Clean Architecture** with **MVVM pattern**

---

## 🧰 Tech Stack

- **Flutter** (Dart)
- **Riverpod** — state management
- Material UI Widgets
- Static mock product data

---

## 🗂 Project Structure

```
lib/
├─ Models/
│  └─ data.dart
│
├─ Services/
│
├─ ViewModels/
│  └─ cart_model.dart
│
├─ Views/
│  ├─ checkout_screen.dart
│  ├─ home_screen.dart
│  ├─ product_detail_screen.dart
│  └─ render_product.dart
│
├─ main.dart
└─ shopping_app.dart
```

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/shoes-shopping-app.git
cd shoes-shopping-app
