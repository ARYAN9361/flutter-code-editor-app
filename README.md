# Flutter Code Editor App

A modern Flutter application featuring three main screens:
- **Home**: Code editor with language selection
- **Explore**: Discover programming languages and courses
- **Profile**: User profile with saved scripts and preferences

## Features

- Dark theme UI with modern design
- Language selection for code editing
- Course exploration and trending topics
- User profile management
- Responsive design for mobile devices

## Screenshots

### Profile Page
- User avatar and basic info
- Saved scripts section
- Preferences and settings

### Explore Page  
- Search functionality
- Trending topics
- Language categories
- Course recommendations

### Home Page (Code Editor)
- Language selection grid
- Popular programming languages
- Interactive language cards

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart              # Main app entry point
├── screens/
│   ├── home_page.dart     # Code editor home screen
│   ├── explore_page.dart  # Explore languages and courses
│   └── profile_page.dart  # User profile screen
└── theme/
    └── app_theme.dart     # Dark theme configuration
```

## Technologies Used

- Flutter
- Dart
- Material Design 3
- Custom dark theme

## Development

To add new features or modify existing ones:

1. Update the relevant screen in `lib/screens/`
2. Modify theme in `lib/theme/app_theme.dart`
3. Add new dependencies in `pubspec.yaml`
4. Run `flutter pub get` to install new dependencies

## License

This project is open source and available under the MIT License.
