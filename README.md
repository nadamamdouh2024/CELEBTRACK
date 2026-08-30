# 🌟 CelebTrack - Celebrity Discovery & AI Assistant

A modern, cross-platform Flutter application designed for exploring popular celebrities, discovering detailed biographies, managing favorites, and interacting with an AI Chatbot powered by Google's Gemini API.

---

## 📱 Features

* **Popular Celebrities Grid:** Browse trending and popular actors with smooth scrolling and responsive UI.
* **Celebrity Details:** View detailed actor profiles, biographical info, and comprehensive movie credits.
* **Interactive Image Gallery:** High-resolution image viewing with full-screen zoom and gallery capabilities.
* **Favorites System:** Save favorite celebrities locally for quick access.
* **AI-Powered Chatbot:** Fast, conversational assistant powered by Google Gemini API (`gemini-3.6-flash`).

---

## 🏗️ Architecture & State Management

The application follows clean architectural principles with strict separation of concerns:

* **State Management:** BLoC / Cubit pattern for predictable state transitions:
  * `PopularCubit` & `PopularState`
  * `DetailsCubit` & `DetailsState`
  * `FavoriteCubit` & `FavoriteState`
  * `ChatCubit` & `ChatState`
* **Layered Structure:**
  * `Core/`: API endpoints, application themes, and shared constants.
  * `Data/`: HTTP client requests, remote data sources, and network models.
  * `Domains/`: Data entities and business logic models.
  * `Presentations/`: UI screens, modular widgets, and BLoC cubits.

---

## 🛠️ Tech Stack & Dependencies

* **Framework:** [Flutter](https://flutter.dev/) (Dart SDK)
* **State Management:** [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
* **Networking:** [`http`](https://pub.dev/packages/http)
* **AI Integration:** Google Gemini Generative AI API (`gemini-3.6-flash`)

---

## 📂 Project Structure

```text
lib/
├── Core/
│   ├── App_Apis/
│   └── App_Colors/
├── Data/
│   └── Requests/
├── Domains/
│   └── models/
└── Presentations/
    ├── cubitsChat/
    ├── cubitsDetails/
    ├── cubitsFavorite/
    ├── cubitsPopular/
    ├── Screens/
    └── Widgets/
```
---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (`>= 3.0.0`)
* Android Studio / VS Code
* Google Gemini API Key

---


### Installation

1. **Clone the repository:**

   ```bash
   git clone [https://github.com/nadamamdouh2024/CELEBTRACK.git](https://github.com/nadamamdouh2024/CELEBTRACK.git)
   cd CELEBTRACK
---


2. **Install dependencies:**
   
   ```bash
   flutter pub get  

---

3. **Configure API Key:**
   
   Add your Gemini API key in lib/Core/App_Apis/app_apis.dart:
   
   ```Dart
   class AppApis {
      static const String geminiApiKey = 'YOUR_GEMINI_API_KEY';
   } 

---
4. **Run the app:**
   
     ```bash
     flutter run


---


## 📄 License & Copyright


Copyright © 2026  **  Nada Mamdouh  ** . All rights reserved.

This project is open source and available under the terms of the [MIT License](LICENSE).


---










