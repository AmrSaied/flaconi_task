import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_task/core/constants/widget_keys.dart';
import 'package:weather_task/core/extension/string_extension.dart';
import 'package:weather_task/presentation/main/widgets/weather_forcast_list.dart';
import 'package:weather_task/presentation/ui_models/weather_ui_Model.dart';

class MainWeatherCard extends StatelessWidget {
  final WeatherDataUiModel selectedWeatherUIModel;
  final String tempUnit;
  final void Function(int index) onChipTapped;

  const MainWeatherCard({
    super.key,
    required this.selectedWeatherUIModel,
    required this.onChipTapped,
    required this.tempUnit,
  });

  @override
  Widget build(BuildContext context) {
    final currentWeatherModel = selectedWeatherUIModel
        .weatherDayList[selectedWeatherUIModel.selectedIndex];
    final bgColor = currentWeatherModel.weatherTitle.weatherBgColor;
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                bgColor.withOpacity(0.3),
                bgColor.withOpacity(0.5),
                bgColor.withOpacity(0.8),
                bgColor,
              ], center: Alignment.center, radius: 1 // Center of the gradient
                  ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectedWeatherUIModel.day,
                    key: const Key(WidgetKeys.dayWidgetKey),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          currentWeatherModel.city,
                          key: const Key(WidgetKeys.cityWidgetKey),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      currentWeatherModel.weatherTitle,
                      key: const Key(WidgetKeys.weatherConditionWidgetKey),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tempUnit == 'c'
                          ? currentWeatherModel.tempC
                          : currentWeatherModel.tempF,
                      key: const Key(WidgetKeys.temperatureWidgetKey),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                      ),
                    ),
                    Image.network(
                      currentWeatherModel.icon,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      child: Chip(
                        avatar: const Icon(
                          Icons.water_drop_outlined,
                          size: 16,
                        ),
                        label: Text(
                          currentWeatherModel.humidity,
                          key: const Key(WidgetKeys.humidityWidgetKey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      child: Chip(
                        avatar: const Icon(
                          Icons.electric_meter_outlined,
                          size: 16,
                        ),
                        label: Text(
                          currentWeatherModel.pressure,
                          key: const Key(WidgetKeys.pressureWidgetKey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      child: Chip(
                        avatar: const Icon(
                          Icons.wind_power_outlined,
                          size: 16,
                        ),
                        label: Text(
                          currentWeatherModel.windSpeed,
                          key: const Key(WidgetKeys.windSpeedWidgetKey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        WeatherForecastList(
          onTap: onChipTapped,
          weatherList: selectedWeatherUIModel.weatherDayList,
          selectedIndex: selectedWeatherUIModel.selectedIndex,
        ),
      ],
    );
  }
}
