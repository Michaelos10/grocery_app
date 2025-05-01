# Grocery Store App
A Flutter-based grocery shopping app with category filtering, cart functionality, and dynamic product listings.
How to Run the Project
## Getting Started
Requirements:
- Flutter SDK (3.x recommended)
- Dart SDK
- Android Studio / Xcode / VS Code (optional)
- Device or emulator

Steps:
1. Clone the repo
   git clone https://github.com/Michaelos10/grocery_app/tree/main/grocery_store
   cd grocery_store

2. Install dependencies
   flutter pub get

3. Run the app
   flutter run

# Architecture Decisions
## State Management:
Provider for lightweight and efficient state management. It keeps the app reactive and decoupled.

# App Structure:
lib/

├──  data/

|      ├── models/ 		 → Data models (e.g., GroceryItem, ReviewItem)

|      |── data_sources/      → Static data (e.g., ProductData)

├── domain/

│    ├──  providers/     → State management (e.g., CartProvider, GroceryProvider)

├── presentation/

│    ├── screens/       → UI screens (e.g., Home, Checkout)


│    ├──  widgets/       → Reusable components (e.g., searchBar)

├── theme/             → App styling/colors

├── main.dart

## UI Design:
Based on minimal, clean design principles. Modular widgets like caer Item tile are styled to match user expectations (for modern e-commerce apps).
# Trade-offs Made
## Provider vs Riverpod / Bloc:
Provider choosen for simplicity and lower boilerplate in a medium-scale app. In a larger app, Riverpod or Bloc may be more scalable
## Hardcoded Data vs Backend:
Static data (e.g., ProductData) is used for prototyping. For production, integration with an API or Firebase is recommended.

# Single Language Support:
The app currently supports only English. Internationalization (i18n) is not implemented to keep development focused.
