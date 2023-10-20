import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_task/core/extension/string_extension.dart';
import 'package:weather_task/domain/models/location/location_data.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/domain/use_case/get_current_weather_use_case.dart';
import 'package:weather_task/domain/use_case/get_location_use_case.dart';
import 'package:weather_task/presentation/ui_models/weather_ui_Model.dart';

class MainController extends GetxController
    with StateMixin<List<WeatherDataUiModel>> {
  final GetLocationUseCase _locationUseCase;
  final GetCurrentWeatherUseCase _currentWeatherUseCase;

  MainController(
    this._locationUseCase,
    this._currentWeatherUseCase,
  );

  late RefreshController refreshController;

  String _tempUnit = 'c';
  String get tempUnit => _tempUnit;
  void setTempUnit(String? unit) {
    _tempUnit = unit ?? 'c';
    update();
  }

  WeatherDataUiModel? _selectedWeather;
  WeatherDataUiModel? get selectedWeather => _selectedWeather;
  void onSelectWeather(WeatherDataUiModel value) {
    _selectedWeather = value;
    update();
  }

  Future<LocationData?> _getLocation() async {
    final locationDataOrFail = await _locationUseCase();
    return locationDataOrFail.fold(
      (l) {
        change(null, status: RxStatus.error(l.message));
        return null;
      },
      (locationData) => locationData,
    );
  }

  Future<ClimateData?> _getCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    final weatherDataOrFail = await _currentWeatherUseCase(
      lat: lat,
      lon: lon,
    );
    return weatherDataOrFail.fold(
      (l) {
        change(null, status: RxStatus.error(l.message));
        return null;
      },
      (climateData) => climateData,
    );
  }

  Future<void> _getWeather() async {
    change(null, status: RxStatus.loading());
    final locationOrNull = await _getLocation();
    if (locationOrNull == null) {
      return;
    }
    final climateDataOrNull = await _getCurrentWeather(
      lat: locationOrNull.lat!,
      lon: locationOrNull.lon!,
    );
    if (climateDataOrNull != null) {
      final List<WeatherDataUiModel> weatherDataUiModels = [];
      final groupedResult =
          groupBy(climateDataOrNull.data, (value) => value.dtTxt.fullDayOfDate);

      for (final day in groupedResult.keys) {
        weatherDataUiModels.add(
          WeatherDataUiModel.fromResponse(
            day,
            groupedResult[day]!,
            climateDataOrNull.city!.name.orEmpty,
          ),
        );
      }
      onSelectWeather(weatherDataUiModels.first);
      change(weatherDataUiModels, status: RxStatus.success());
    }
  }

  Future<void> onRefresh() async {
    await _getWeather();
    refreshController.refreshCompleted();
  }

  @override
  void onInit() async {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    await _getWeather();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
