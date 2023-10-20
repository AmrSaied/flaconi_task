import 'package:dartz/dartz.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/location/location_data.dart';
import 'package:weather_task/domain/repository/geo_location_repository.dart';

class GetLocationUseCase {
  final BaseGeoLocationRepository _baseGeoLocationRepository;
  GetLocationUseCase(this._baseGeoLocationRepository);

  Future<Either<Failure, LocationData>> call() async {
    return await _baseGeoLocationRepository.getGeoLocation();
  }
}
