import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_task/core/network/network_service.dart';
import 'package:weather_task/data/repository/geo_location_repo_impl.dart';
import 'package:weather_task/data/repository/weather_repository_impl.dart';
import 'package:weather_task/domain/repository/geo_location_repository.dart';
import 'package:weather_task/domain/repository/weather_repository.dart';
import 'package:weather_task/domain/use_case/get_current_weather_use_case.dart';
import 'package:weather_task/domain/use_case/get_location_use_case.dart';
import 'package:weather_task/presentation/main/controllers/main_controller.dart';

class AppBinding extends Bindings {
  final bool isMock;

  AppBinding({this.isMock = false});

  @override
  void dependencies() {
    Get.put<NetworkService>(NetworkService()..mock = isMock);
    Get.lazyPut<BaseWeatherRepository>(
      () => WeatherRepositoryImpl(
        Get.find<NetworkService>(),
      ),
    );
    Get.lazyPut<BaseGeoLocationRepository>(
      () => GeoLocationRepositoryImpl(),
    );
    Get.lazyPut<GetLocationUseCase>(
      () => GetLocationUseCase(
        Get.find<BaseGeoLocationRepository>(),
      ),
    );
    Get.lazyPut<GetCurrentWeatherUseCase>(
      () => GetCurrentWeatherUseCase(
        Get.find<BaseWeatherRepository>(),
      ),
    );
    Get.lazyPut<MainController>(
      () => MainController(
        Get.find<GetLocationUseCase>(),
        Get.find<GetCurrentWeatherUseCase>(),
      ),
      fenix: true,
    );
  }
}
