# 📰 News App

A modern Flutter News Application that allows users to browse and discover the latest news through different categories, with location-based features and a clean, responsive user interface.

Built with **Flutter & Dart**, the application focuses on clean UI, API integration, state management, responsive design, and a smooth user experience.

---

## 📱 About The Project

**News App** is a mobile news application developed using Flutter.

The application is designed to provide users with an easy and modern way to browse news content while supporting different categories and location-related features.

The project also includes responsive layouts, network image handling, API communication, location services, and map integration.

---

## ✨ Features

- 📰 Browse news articles
- 🔎 Discover different news content
- 📂 News categories
- 🌐 API integration
- 📍 Location services
- 🗺️ Google Maps integration
- 🖼️ Network image caching
- 📱 Responsive UI for different screen sizes
- 🎨 SVG asset support
- 🔄 State management using BLoC
- 💾 Local data storage
- 📷 Image picker support
- 🚀 Custom application launcher icon
- 🎯 Clean and organized Flutter project structure

---

## 🛠️ Technologies & Packages

### Framework

- **Flutter**
- **Dart**

### State Management

- **Flutter BLoC**

### Networking

- **Dio**

### Functional Programming

- **Dartz**

### Local Storage

- **Shared Preferences**

### Responsive UI

- **Flutter ScreenUtil**

### UI & Assets

- **Flutter SVG**
- **Smooth Page Indicator**
- **Cached Network Image**

### Location & Maps

- **Google Maps Flutter**
- **Geolocator**

### Utilities

- **Intl**
- **Image Picker**
- **Flutter Launcher Icons**

---

## 📦 Main Dependencies

```yaml
smooth_page_indicator: ^3.0.0
flutter_screenutil: ^5.9.3
flutter_svg: ^2.3.0
dio: ^5.11.1
dartz: ^0.10.1
shared_preferences: ^2.5.5
image_picker: ^1.2.2
flutter_bloc: ^9.1.1
google_maps_flutter: ^2.14.2
geolocator: ^14.0.2
intl: ^0.20.3
cached_network_image: ^3.4.1
flutter_launcher_icons: ^0.14.4
🏗️ Project Structure

The project is organized into different parts to keep the application maintainable and easier to develop.

lib/
│
├── core/
│   ├── constants/
│   ├── network/
│   ├── services/
│   ├── theme/
│   └── utils/
│
├── features/
│   └── ...
│
└── main.dart

The exact structure may evolve as the project continues to be developed.

🎨 UI & Responsive Design

The application uses:

flutter_screenutil for responsive layouts
SVG assets for scalable icons
Cached network images for better image loading
Smooth page indicators for onboarding/page navigation
Custom fonts and assets
Material Design components

The goal is to provide a consistent experience across different device screen sizes.

🌐 API Integration

The application communicates with remote APIs using Dio.

Dio is responsible for:

Sending HTTP requests
Receiving API responses
Handling network communication
Working with JSON data
Managing API-related errors
🔄 State Management

The application uses BLoC (Business Logic Component) for state management.

BLoC helps separate:

UI
 ↓
BLoC
 ↓
Business Logic
 ↓
Repository / API
 ↓
Remote Data

This makes the application easier to maintain and scale.

📍 Location & Maps

The project integrates location-based functionality using:

Google Maps Flutter
Geolocator

These packages can be used for:

Getting the user's current location
Working with latitude and longitude
Displaying locations on Google Maps
Location-based application features
💾 Local Storage

The application uses Shared Preferences for storing lightweight local data.

Examples include:

User preferences
Simple application settings
Local flags
Small pieces of persistent data
🖼️ Assets

Application assets are stored inside:

assets/
└── images/

The project also includes a custom launcher icon configuration:

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/iconkhabor.png"
🚀 Getting Started

Follow these steps to run the project locally.

1. Clone the Repository
git clone https://github.com/7amo-Sa/News-App.git
2. Navigate to the Project
cd News-App
3. Get Dependencies
flutter pub get
4. Run the Application
flutter run
🔧 Build APK

To create a release APK:

flutter build apk --release

The generated APK will normally be located at:

build/app/outputs/flutter-apk/app-release.apk
📱 Supported Platforms

The Flutter project contains platform support for:

Android
iOS
Web
Linux
macOS
Windows

The available features may vary depending on the platform, especially location and Google Maps functionality.

⚙️ Requirements

Before running the project, make sure you have:

Flutter SDK
Dart SDK
Android Studio or VS Code
Android SDK
Git

The project currently requires Dart SDK:

>=3.9.2 <4.0.0
🧪 Development

For development:

flutter pub get
flutter analyze
flutter run

To check outdated dependencies:

flutter pub outdated
📂 Repository

GitHub Repository:

https://github.com/7amo-Sa/News-App

👨‍💻 Developer
Mohamed Sayed

Flutter Developer

GitHub:

https://github.com/7amo-Sa

📄 License

This project is available for educational and development purposes.

⭐ Support

If you find this project useful, feel free to:

⭐ Star the repository
🍴 Fork the project
🐛 Open an issue
💡 Suggest improvements
🚧 Project Status

Active Development

New features, improvements, and refinements may be added over time.
