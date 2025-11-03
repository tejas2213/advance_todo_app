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

### Database
- DB file: `TodoDB.db`
- Table: `Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, date TEXT)`
- Migration: Adds `id` if an older DB without `id` exists.



