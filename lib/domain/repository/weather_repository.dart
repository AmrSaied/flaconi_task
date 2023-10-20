import 'package:dartz/dartz.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, ClimateData>> getWeatherInfo({
    required double lat,
    required double long,
  });
}
