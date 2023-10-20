import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/constants/api_constants.dart';
import 'package:weather_task/core/error/failure.dart';
import 'package:weather_task/core/network/network_service.dart';
import 'package:weather_task/data/repository/weather_repository_impl.dart';
import 'package:weather_task/domain/models/location/location_data.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/domain/repository/geo_location_repository.dart';
import 'package:weather_task/domain/repository/weather_repository.dart';

import 'weather_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BaseGeoLocationRepository>(),MockSpec<BaseWeatherRepository>()])
void main() {
  late NetworkService networkService;
  late BaseWeatherRepository weatherRepository;
  late BaseGeoLocationRepository geoLocationRepository;
  setUp(() {
    networkService = NetworkService();
    weatherRepository = WeatherRepositoryImpl(networkService);
    geoLocationRepository = MockBaseGeoLocationRepository();
  });

// Define a mock for your locationUseCase

  group('get geo location', () {
    test('getGeoLocation returns location data', () async {
      when(geoLocationRepository.getGeoLocation()).thenAnswer(
          (_) async => right(const LocationData(lat: 32.0, lon: 22.0)));

      final result = await geoLocationRepository.getGeoLocation();
      final location = result.getOrElse(() => const LocationData());

      expect(result.isRight(), true);
      expect(location.lat, isNotNull);
      expect(location.lon, isNotNull);
    });

    test('getGeoLocation returns location data', () async {
      Failure? failure;
      LocationData? location;
      when(geoLocationRepository.getGeoLocation()).thenAnswer(
          (_) async => left(const ApiFailure(message: 'something went wrong')));

      final resultOrFail = await geoLocationRepository.getGeoLocation();
      resultOrFail.fold(
        (l) {
          failure = l;
        },
        (r) => location = const LocationData(),
      );
      expect(resultOrFail.isLeft(), true);
      expect(location, isNull);
      expect(failure, isNotNull);
    });
  });

  group('weather repo', () {
    test(
      'test weather success',
      () async {
        networkService.onInit();
        ClimateData? climateData;
        final response = await weatherRepository.getWeatherInfo(
          lat: 44.34,
          long: 10.99,
        );

        climateData = response.getOrElse(() => const ClimateData(data: []));

        expect(climateData.data, isNotEmpty);
      },
    );

    test(
      'test weather api failure',
      () async {
        networkService.mock = true;
        networkService.onInit();
        Failure? failure;
        networkService.dioAdapter!.onGet(
          ApiConstants.currentWeatherEndpoint,
          (server) => server.reply(503, {}),
        );

        final response = await weatherRepository.getWeatherInfo(
          lat: 44.34,
          long: 10.99,
        );
        response.fold(
          (l) => failure = l,
          (r) => null,
        );

        expect(response.isLeft(), true);
        expect(failure, isNotNull);
        expect(failure?.message, isNotNull);
      },
    );
  });
}
