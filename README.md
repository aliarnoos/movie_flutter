# Movie App

A Flutter application that showcases trending movies, supporting infinite scrolling and detailed views for individual movies.

## Personal Note

This project was completed in less than 8 hours and represents my first entry into writing Flutter and Dart. Despite being new to these technologies, I found the experience enjoyable and the learning curve pleasantly manageable. I am eager to hear your feedback and look forward to improving and expanding my skills in this area.

## Screenshots

Here are some screenshots of the app in action:

<p float="left">
  <img src="https://imgtr.ee/images/2024/07/25/47ffc64f397f930878ef1c4b10fec5c2.png" width="400" alt="Home Screen" title="Home Screen" />
  <img src="https://imgtr.ee/images/2024/07/25/30c84b6760ad271c09769cb48c98bfc0.png" width="400" alt="Movie Details" title="Movie Details" />
</p>

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

