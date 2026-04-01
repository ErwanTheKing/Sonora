<p align="center">
  <img src="assets/logo.png" width="180"/>
</p>

<h1 align="center">🎧 Sonara</h1>

<p align="center">
<b>🇫🇷 Découvre une nouvelle musique chaque jour.</b><br>
<b>🇬🇧 Discover a new song every day.</b>
</p>

---

# 📖 About

**Sonara** is a mobile application built with **Flutter** that helps users  
**discover new music every day**.

Users can:

- Discover new songs
- Save songs as favorites
- Add songs directly to their **Spotify account**

The goal of this project is to create a **simple and useful mobile app**  
focused on music discovery.

---

# 🎯 Features

## Current Features (MVP)

- 🎧 Discover a daily song
- ⭐ Add songs to favorites (inside the app)
- ⏭️ Skip songs
- 📜 View song history
- 💾 Save preferences locally

---

## Upcoming Features

- 🎵 Connect Spotify account
- ➕ Add songs to Spotify favorites
- 📱 Improve UI and navigation

---

# 📱 Platforms

| Platform | Status |
|----------|--------|
| Android | 🟢 In development |
| iOS | 🔜 Planned |

---

# 🧱 Tech Stack

This project uses simple and beginner-friendly technologies.

## Mobile Development

- **Flutter**
- **Dart**
- **Android Studio**

## Packages

- `shared_preferences`  
  Save favorites and history locally

- `http` *(future)*  
  Connect to Spotify API

---

# 📁 Project Structure

```text
sonara/
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