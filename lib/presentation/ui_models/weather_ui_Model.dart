import 'package:weather_task/core/extension/string_extension.dart';
import 'package:weather_task/domain/models/weather/weather_data.dart';

class WeatherDataUiModel {
  final String day;
  final List<WeatherUIModel> weatherDayList;
  final int selectedIndex;

  WeatherDataUiModel({
    required this.day,
    required this.weatherDayList,
    required this.selectedIndex,
  });

  factory WeatherDataUiModel.fromResponse(
    String day,
    List<WeatherData> data,
    String city,
  ) {
    return WeatherDataUiModel(
      selectedIndex: 0,
      day: day,
      weatherDayList:
          data.map((e) => WeatherUIModel.fromWeatherData(e, city)).toList(),
    );
  }

  WeatherDataUiModel copyWith({int? selectedIndex}) => WeatherDataUiModel(
        day: day,
        weatherDayList: weatherDayList,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}

class WeatherUIModel {
  final String windSpeed;
  final String pressure;
  final String humidity;
  final String tempF;
  final String tempC;
  final String weatherTitle;
  final String weatherDescription;
  final String icon;
  final String date;
  final String city;
  final String hour;

  const WeatherUIModel({
    required this.windSpeed,
    required this.pressure,
    required this.humidity,
    required this.tempF,
    required this.tempC,
    required this.weatherTitle,
    required this.weatherDescription,
    required this.icon,
    required this.date,
    required this.city,
    required this.hour,
  });

  factory WeatherUIModel.fromWeatherData(WeatherData data, String city) {
    final weather = data.weather!.first;
    final temp = data.main?.temp ?? 0;
    final tempC = temp.toStringAsFixed(1);
    final tempF = ((temp * (9 / 5)) + 32).toStringAsFixed(1);
    final date = data.dtTxt.dayOfDate;
    final hour = data.dtTxt.hours;
    return WeatherUIModel(
      windSpeed: '${data.wind?.speed} m/s',
      pressure: '${data.main?.pressure} hPa',
      humidity: '${data.main?.humidity} %',
      weatherTitle: weather.main.orEmpty,
      weatherDescription: weather.description.orEmpty,
      icon: weather.icon.weatherIconUrl,
      date: date,
      hour: hour,
      city: city,
      tempF: '$tempF°f',
      tempC: '$tempC°c',
    );
  }
}
