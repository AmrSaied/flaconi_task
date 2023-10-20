import 'package:weather_task/domain/models/weather/city.dart';
import 'package:weather_task/domain/models/weather/weather_data.dart';

class ClimateData {
  final List<WeatherData> data;
  final City? city;

  const ClimateData({
    required this.data,
    this.city,
  });

  factory ClimateData.fromJson(dynamic json) => ClimateData(
        city: City.fromJson(json['city']),
        data: (json['list'] as List?)?.map(WeatherData.fromJson).toList() ??
            const <WeatherData>[],
      );
}
