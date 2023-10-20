import 'package:dartz/dartz.dart';
import 'package:weather_task/core/constants/api_constants.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/core/network/network_service.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends BaseWeatherRepository {
  final NetworkService _networkService;
  WeatherRepositoryImpl(this._networkService);
  @override
  Future<Either<Failure, ClimateData>> getWeatherInfo({
    required double lat,
    required double long,
  }) async {
    final responseOrFailure = await _networkService.get(
      endpoint: ApiConstants.currentWeatherEndpoint,
      queryParameters: {
        'lat': lat,
        'lon': long,
        'units': 'metric',
      },
    );
    return responseOrFailure.fold(
      left,
      (response) {
        final climateData = ClimateData.fromJson(response.data);
        return right(climateData);
      },
    );
  }
}
