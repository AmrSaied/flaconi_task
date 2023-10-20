import 'package:dartz/dartz.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final BaseWeatherRepository _weatherRepository;
  GetCurrentWeatherUseCase(this._weatherRepository);

  Future<Either<Failure, ClimateData>> call({
    required double lat,
    required double lon,
  }) async {
    return await _weatherRepository.getWeatherInfo(
      lat: lat,
      long: lon,
    );
  }
}
