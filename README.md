# Flutter Weather App

This Flutter application is built using clean architecture principles, data binding, and includes animations, unit tests, and UI tests. It displays weather information for a given city using the REST API provided by [OpenWeatherMap](https://openweathermap.org/api). The goal is to create a clean and well-structured Flutter app with a rich feature set.

## Features

- Loading indicator displayed while fetching weather data.
- Weather list items containing day of the week abbreviation and weather condition image.
- Weather details include the day of the week, weather condition name and image, current temperature, humidity, pressure, and wind.
- Selecting a weather list item updates the details.
- Weather information can be refreshed with a pull-to-refresh gesture.
- An error screen with a retry button is shown when fetching data fails.
- Supports horizontal and vertical layouts.
- Allows changing the temperature unit (Celsius/Fahrenheit).

## Project Structure

- `/lib`: Contains the Dart code for the Flutter app.
  - `/data`: Includes data sources and repositories for weather data.
  - `/domain`: Contains the business logic and use cases.
  - `/presentation`: Houses the user interface, widgets, and view models.
- `/test`: Includes unit and UI tests.
- `/assets`: Place weather condition images and other static assets here.

## Dependencies

This project uses several dependencies to enhance its functionality:

- `cupertino_icons: ^1.0.2`: Icon library for iOS-style icons.
- `get: ^4.6.6`: State management and dependency injection library.
- `dio: ^5.3.3`: HTTP client for making API requests.
- `dartz: ^0.10.1`: Functional programming library for Dart.
- `geolocator: ^10.1.0`: Library for obtaining the device's location.
- `mockito: ^5.4.2`: Mocking library for testing.
- `http_mock_adapter: ^0.6.0`: Mock HTTP requests for testing.
- `cached_network_image: ^3.3.0`: Caches network images to improve performance.
- `intl: ^0.18.1`: Internationalization and localization support.
- `collection: ^1.17.2`: Provides additional collection-related functions.
- `pull_to_refresh: ^2.0.0`: A Flutter pull-to-refresh widget.
- `shimmer: ^3.0.0`: Creates shimmering loading animations.

To install these dependencies, you can use the following command:

```sh
flutter pub get
```

## Getting Started

## 1-Clone the repository:

```sh
git clone https://github.com/AmrSaied/flaconi_task
```

## 2 - Navigate to the project directory:

```sh
cd flaconi_task
```
## 3 - Install dependencies:

```sh
flutter pub get
```

##  4- Run the app:
```sh
flutter run
```

##  Testing

This project includes unit tests and UI tests to ensure the app's reliability and functionality. You can run the tests using the following commands:

## To run unit tests:

```sh
flutter test
```
## To run UI tests:
```sh
flutter drive --target=test_driver/app.dart
```

##  License
This project is licensed under the MIT License - see the LICENSE.md file for details.

##  Acknowledgments
We would like to thank OpenWeatherMap for providing the weather data API.

