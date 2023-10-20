import 'package:weather_task/domain/models/weather/coord.dart';

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int sunrise;
  final int sunset;

  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(dynamic json) => City(
        id: json['id'],
        name: json['name'],
        coord: Coord.fromJson(json['coord']),
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
