<p align="center">
  <img src="assets/logo.png" width="500"/>
</p>

<h1 align="center">🎧 Sonora</h1>

<p align="center">
<b>🇫🇷 Découvre une nouvelle musique chaque jour.</b><br>
<b>🇬🇧 Discover a new song every day.</b>
</p>

---

# 📖 About

**Sonora** is a mobile application built with **Flutter** that helps users  
**discover new music every day**.

The application focuses on **music discovery**, allowing users to:

- Discover new songs
- Save songs as favorites
- View previously discovered songs
- Add songs to their **Spotify account** *(planned)*

Sonora is designed to be simple, useful, and easy to use.

---

# 🎯 Features

## Current Features (MVP)

- 🎧 Discover a daily song
- ⭐ Add songs to favorites
- 📜 View song history
- ⏭️ Skip songs
- 💾 Save favorites locally

---

## Upcoming Features

- 🎵 Connect Spotify account
- ➕ Add songs to Spotify favorites
- 🎨 Improve UI design

---

# 📱 Platforms

| Platform | Status |
|----------|--------|
| Android | 🟢 In development |
| iOS | 🔜 Planned |

---

# 🧱 Tech Stack

## Mobile

- Flutter
- Dart
- Android Studio

## Packages

- shared_preferences  
  (Store favorites and history locally)

- http *(future)*  
  (Spotify communication)

---

# 📁 Project Structure

```text
sonora/
│
├── assets/
│   └── logo.png
│
├── lib/
│   ├── main.dart
│
│   ├── models/
│   │   └── track.dart
│
│   ├── services/
│   │   ├── daily_track_service.dart
│   │   └── spotify_service.dart
│
│   ├── screens/
│   │   ├── today_screen.dart
│   │   ├── favorites_screen.dart
│   │   └── history_screen.dart
│
├── android/
├── ios/
│
├── README.md
└── .gitignore