# Movie App

A Flutter application that showcases trending movies, supporting infinite scrolling and detailed views for individual movies.

## Personal Note

This project was completed in less than 8 hours and represents my first entry into writing Flutter and Dart. Despite being new to these technologies, I found the experience enjoyable and the learning curve pleasantly manageable. I am eager to hear your feedback and look forward to improving and expanding my skills in this area.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or Visual Studio Code with Flutter and Dart plugins installed
- Familiarity with Dart and Flutter framework

### Installation

1. Clone the repository:
2. Navigate to the project directory:
3. Install dependencies:



## Architecture

![Clean Architecture](https://miro.medium.com/v2/resize:fit:4800/format:webp/0*bpZD35FYuNVZCzuW.png "")

The application employs Clean Architecture principles for scalable, maintainable, and testable code:

- **Scalability:** Easily incorporate additional features without significant restructuring.
- **Separation of Concerns:** Distinct layers for UI, business logic, and data handling.
- **Reusability:** Facilitates code reuse across the app through well-defined interfaces.

### Directory Structure

- **/data**
  - **/models**: Data models representing API structures.
  - **/repositories**: Concrete implementation of data handling.
- **/state**
  - **/cubit**: Cubit classes for state management linked to business logic.
- **/ui**
  - **/screens**: Individual screens of the app.
  - **/widgets**: Reusable UI components.
- **/services**
  - Service classes for external data interactions, such as APIs.



## Why Cubit for State Management?

Cubit was chosen for state management in this app for its simplicity and efficiency. It offers a streamlined approach compared to traditional BLoC. As someone writing Flutter and Dart code for the first time I found it easy to use and unerstand.

## Tools Used

- **Flutter SDK**: Core framework for building the app.
- **Dart**: Programming language.
- **Visual Studio Code or Android Studio**: IDEs for development.
- **Git**: Version control system.

## Authors

- **Ali Muhsin** - Initial work - [Github](https://github.com/aliarnoos)

