import 'package:dartz/dartz.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/location/location_data.dart';

abstract class BaseGeoLocationRepository {
  Future<Either<Failure, LocationData>> getGeoLocation();
}
