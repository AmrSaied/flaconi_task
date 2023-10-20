import 'package:weather_task/domain/models/weather/clouds.dart';
import 'package:weather_task/domain/models/weather/main_data.dart';
import 'package:weather_task/domain/models/weather/rain.dart';
import 'package:weather_task/domain/models/weather/sys.dart';
import 'package:weather_task/domain/models/weather/weather.dart';
import 'package:weather_task/domain/models/weather/wind.dart';

class WeatherData {
  final List<Weather>? weather;
  final MainData? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final String? dtTxt;

  const WeatherData({
    this.dtTxt,
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
  });

  WeatherData copyWith({
    List<Weather>? weather,
    MainData? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
  }) =>
      WeatherData(
        weather: weather ?? this.weather,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        rain: rain ?? this.rain,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
      );

  factory WeatherData.fromJson(dynamic json) {
    return WeatherData(
      dt: json['dt'],
      dtTxt: json['dt_txt'],
      visibility: json['visibility'],
      clouds: Clouds.fromJson(json['clouds']),
      main: MainData.fromJson(json['main']),
      rain: Rain.fromJson(json['rain']),
      sys: Sys.fromJson(json['sys']),
      wind: Wind.fromJson(json['wind']),
      weather: (json['weather'] as List?)?.map(Weather.fromJson).toList(),
    );
  }
}
