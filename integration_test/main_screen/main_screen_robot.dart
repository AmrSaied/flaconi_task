import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task/core/constants/widget_keys.dart';

class MainScreenRobot {
  final WidgetTester tester;
  late Finder day,
      city,
      temperature,
      weatherCondition,
      humidity,
      pressure,
      windSpeed;

  MainScreenRobot(this.tester) {
    _findWeatherDay();
    _findWeatherCity();
    _findWeatherCondition();
    _findWeatherTemperature();
    _findWeatherHumidity();
    _findWeatherPressure();
    _findWeatherWindSpeed();
  }

  _findWeatherDay() {
    return day = find.byKey(const Key(WidgetKeys.dayWidgetKey));
  }

  _findWeatherCity() {
    return city = find.byKey(const Key(WidgetKeys.cityWidgetKey));
  }

  _findWeatherTemperature() {
    return temperature = find.byKey(const Key(WidgetKeys.temperatureWidgetKey));
  }

  _findWeatherCondition() {
    return weatherCondition =
        find.byKey(const Key(WidgetKeys.weatherConditionWidgetKey));
  }

  _findWeatherHumidity() {
    return humidity = find.byKey(const Key(WidgetKeys.humidityWidgetKey));
  }

  _findWeatherPressure() {
    return pressure = find.byKey(const Key(WidgetKeys.pressureWidgetKey));
  }

  _findWeatherWindSpeed() {
    return windSpeed = find.byKey(const Key(WidgetKeys.windSpeedWidgetKey));
  }
}
