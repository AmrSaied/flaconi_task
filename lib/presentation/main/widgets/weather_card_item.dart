import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_task/core/extension/string_extension.dart';
import 'package:weather_task/presentation/main/widgets/weather_details_item.dart';
import 'package:weather_task/presentation/ui_models/weather_ui_Model.dart';

class WeatherCardItem extends StatelessWidget {
  final WeatherDataUiModel weatherDataUiModel;
  final String tempUnit;
  final void Function() onTap;


  const WeatherCardItem({
    super.key,
    required this.weatherDataUiModel,
    required this.tempUnit,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    final weatherUIModel = weatherDataUiModel.weatherDayList.first;
    final bgColor = weatherUIModel.weatherTitle.weatherBgColor;
    return InkWell(
      key: Key(weatherUIModel.date),
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [
                          bgColor.withOpacity(0.3),
                          bgColor.withOpacity(0.5),
                          bgColor.withOpacity(0.8),
                          bgColor,
                        ],
                        center: Alignment.center,
                        radius: 1 // Center of the gradient
                        ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        weatherDataUiModel.day,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          weatherUIModel.icon,
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherUIModel.weatherTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tempUnit == 'c'
                                  ? weatherUIModel.tempC
                                  : weatherUIModel.tempF,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        )
                      ],
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
                              weatherUIModel.city,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text(
                              weatherUIModel.date,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              WeatherDetailsItem(
                title: 'Humidity:',
                value: weatherUIModel.humidity.orEmpty,
                icon: Icons.water_drop_outlined,
              ),
              WeatherDetailsItem(
                title: 'Pressure:',
                value: weatherUIModel.pressure.orEmpty,
                icon: Icons.electric_meter_outlined,
              ),
              WeatherDetailsItem(
                title: 'Wind:',
                value: weatherUIModel.windSpeed.orEmpty,
                icon: Icons.wind_power_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
