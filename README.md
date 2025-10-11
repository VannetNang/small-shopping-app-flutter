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
lib/
├─ core/
│  └─ utils/
│     └─ constants.dart          # global constants, colors, etc.
│
├─ data/
│  ├─ models/
│  │  ├─ shoe.dart              # Shoe model
│  │  └─ cart_item.dart         # Cart item model
│  └─ mock/
│     └─ mock_shoes.dart       # Static list of products
│
├─ viewmodel/
│  ├─ shoe_viewmodel.dart      # Handles product filtering & selection
│  └─ cart_viewmodel.dart      # Handles cart logic (add/remove/total)
│
├─ view/
│  ├─ screens/
│  │  ├─ home_screen.dart
│  │  ├─ cart_screen.dart
│  │  └─ checkout_screen.dart
│  └─ widgets/
│     ├─ shoe_card.dart
│     └─ brand_filter.dart
│
├─ app.dart                    # App setup, theme, routes
└─ main.dart

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/shoes-shopping-app.git
cd shoes-shopping-app
