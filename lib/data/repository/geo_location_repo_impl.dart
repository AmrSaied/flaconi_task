import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/location/location_data.dart';
import 'package:weather_task/domain/repository/geo_location_repository.dart';

class GeoLocationRepositoryImpl extends BaseGeoLocationRepository {

  @override
  Future<Either<Failure, LocationData>> getGeoLocation() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return left(const GeneralFailure(message: 'location service disabled'));
    }
    final permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return left(const GeneralFailure(message: 'no permission'));
    }

    final position = await Geolocator.getCurrentPosition();
    return right(LocationData(
      lat: position.latitude,
      lon: position.longitude,
    ));
  }

}
