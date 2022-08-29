# exagram

Create assesments for Enterprises

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

## Architecture

Big picture:

- Application structure: Hexagonal.
- State Management: Getx
- Folder Design: Feature base.

Libraries:

- (GetX)[https://pub.dev/packages/get]: State Manager | Navigation | Dependency Manager Using an
  adaptation of Hexagonal architecture for flutter app.

### Project Structure

```
    lib
    ├── core
    │   └── user # This is a Feature!
    │       ├── data 
    │       │   ├── datasource # Connections with API
    │       │   ├── di # Dependency Injection
    │       │   ├── dto # Objects returned from API
    │       │   ├── mapper # Classes to convert from Json to Domain
    │       │   └── repository # Interface to interact with
    │       └── domain
    │           ├── di # Dependency Injection
    │           ├── entity # Domain Classes
    │           ├── repository # Repository Impl
    │           └── usecase 
    ├── feature
    │   ├── counter # feature name!
    │   │   ├── CounterController.dart
    │   │   └── CounterHome.dart
    │   └── user
    │       ├── controller 
    │       ├── page # We represent a functionality page here
    │       └── widget # Every component we use to compose the page is here
    ├── main.dart # MUST, Main function to start app
    ├── styles.dart # Like CSS styles
    └── utils # Utils methods
```
