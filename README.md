# test_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


- CI/CD Explanation
- name: The name of the workflow (Flutter CI/CD).
- on: Specifies when the workflow will run. In this case, on every push or pull request to the main branch.
- jobs:
 * The job runs on the latest Ubuntu environment (runs-on: ubuntu-latest).
- step:
* actions/checkout@v2: Checks out your code from the repository.
* subosito/flutter-action@v2: Sets up the Flutter environment for GitHub Actions.
* flutter pub get: Installs project dependencies.
* flutter test: Runs Flutter unit tests.
* flutter build apk --release: Builds the APK for Android (optional, only runs on push events).
* actions/upload-artifact@v2: Uploads the built APK as an artifact.
