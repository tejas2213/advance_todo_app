## Advance Todo App

A Flutter To‑Do application showcasing a modern UI (Google Fonts, SVGs, slidable actions) and persistent storage with sqflite.

### Features
- Add, edit, and delete todos
- Persistent storage using `sqflite`
- Bottom sheet create/edit form with date picker
- Swipe actions using `flutter_slidable`
- Custom typography via `google_fonts` and SVG asset support via `flutter_svg`

### Tech Stack
- Flutter 3.22+
- Dart 3+
- Android Gradle Plugin 8.4+
- Kotlin 1.9+
- Gradle 8.6

### Project Structure
- `lib/TodoModel.dart` – Todo data model with `id`, `title`, `description`, `date`
- `lib/db_helper.dart` – Database helper (init, migration, CRUD)
- `lib/main.dart` – App bootstrap; ensures DB is ready before UI
- `lib/TodoScreen.dart` – UI; loads todos from DB and performs CRUD
- `assets/svg/img.svg` – Sample avatar/icon used in list items

### Getting Started
1) Install dependencies
```bash
flutter pub get
```

2) Run on Android (recommended for sqflite)
```bash
flutter run
```

3) Date picker not opening inside bottom sheet?
- The Date field is read‑only and unfocuses the keyboard before launching the picker, with a safe date range set. Tap the field to open it.

### Notes on Platforms
- Android/iOS: sqflite is fully supported.
- Windows/macOS/Linux: If you run on desktop, sqflite is not available by default. You can use `sqflite_common_ffi`. This project targets mobile; run on Android/iOS for a seamless experience.

### Database
- DB file: `TodoDB.db`
- Table: `Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, date TEXT)`
- Migration: Adds `id` if an older DB without `id` exists.

### Common Commands
```bash
# Analyze
flutter analyze

# Clean & re‑resolve deps
flutter clean && flutter pub get

# Run on a specific device
flutter devices
flutter run -d <deviceId>
```

### Troubleshooting
- Android build errors about Gradle/Kotlin: this repo is configured for AGP 8.4, Kotlin 1.9.24, Gradle 8.6, Java 17. Make sure your environment matches or let Flutter manage it.
- If IDE fails to resolve `flutter_slidable`, run `flutter pub get` and restart the analyzer/IDE.

### License
This project is provided as‑is for learning purposes.
