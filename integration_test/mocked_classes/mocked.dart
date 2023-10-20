import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/domain/repository/weather_repository.dart';

class _FakeEither_0<L, R> extends SmartFake implements Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class MockGeoLocator extends GeolocatorPlatform with Mock {}

class MockGeoLocatorPlatform extends MockGeoLocator {
  Position get mockPosition => Position(
      latitude: 33.0,
      longitude: 30.0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        500,
        isUtc: true,
      ),
      altitude: 3000.0,
      altitudeAccuracy: 0.0,
      accuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);

  @override
  Future<LocationPermission> checkPermission() =>
      Future.value(LocationPermission.whileInUse);

  @override
  Future<LocationPermission> requestPermission() =>
      Future.value(LocationPermission.whileInUse);

  @override
  Future<bool> isLocationServiceEnabled() => Future.value(true);

  @override
  Future<Position> getLastKnownPosition({
    bool forceLocationManager = false,
  }) =>
      Future.value(mockPosition);

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) =>
      Future.value(mockPosition);

  @override
  Stream<ServiceStatus> getServiceStatusStream() {
    return super.noSuchMethod(
      Invocation.method(
        #getServiceStatusStream,
        null,
      ),
      returnValue: Stream.value(ServiceStatus.enabled),
    );
  }

  @override
  Stream<Position> getPositionStream({
    LocationSettings? locationSettings,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #getPositionStream,
        null,
        <Symbol, Object?>{
          #desiredAccuracy: locationSettings?.accuracy ?? LocationAccuracy.best,
          #distanceFilter: locationSettings?.distanceFilter ?? 0,
          #timeLimit: locationSettings?.timeLimit ?? 0,
        },
      ),
      returnValue: Stream.value(mockPosition),
    );
  }

  @override
  Future<bool> openAppSettings() => Future.value(true);

  @override
  Future<LocationAccuracyStatus> getLocationAccuracy() =>
      Future.value(LocationAccuracyStatus.reduced);

  @override
  Future<LocationAccuracyStatus> requestTemporaryFullAccuracy({
    required String purposeKey,
  }) =>
      Future.value(LocationAccuracyStatus.reduced);

  @override
  Future<bool> openLocationSettings() => Future.value(true);

  @override
  double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) =>
      42;

  @override
  double bearingBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) =>
      42;
}

class MockBaseWeatherRepository extends Mock implements BaseWeatherRepository {
  @override
  Future<Either<Failure, ClimateData>> getWeatherInfo({
    required double? lat,
    required double? long,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWeatherInfo,
          [],
          {
            #lat: lat,
            #long: long,
          },
        ),
        returnValue: Future<Either<Failure, ClimateData>>.value(
            _FakeEither_0<Failure, ClimateData>(
          this,
          Invocation.method(
            #getWeatherInfo,
            [],
            {
              #lat: lat,
              #long: long,
            },
          ),
        )),
        returnValueForMissingStub: Future<Either<Failure, ClimateData>>.value(
            _FakeEither_0<Failure, ClimateData>(
          this,
          Invocation.method(
            #getWeatherInfo,
            [],
            {
              #lat: lat,
              #long: long,
            },
          ),
        )),
      ) as Future<Either<Failure, ClimateData>>);
}
