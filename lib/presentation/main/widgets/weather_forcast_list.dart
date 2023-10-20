import 'package:flutter/material.dart';
import 'package:weather_task/presentation/ui_models/weather_ui_Model.dart';

class WeatherForecastList extends StatelessWidget {
  final List<WeatherUIModel> weatherList;
  final int selectedIndex;
  final void Function(int index) onTap;
  const WeatherForecastList({
    super.key,
    required this.weatherList,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weatherList.map((weather) {
          final index = weatherList.indexOf(weather);
          final isSelected = selectedIndex == index;
          return InkWell(
            onTap: () => onTap(index),
            child: Chip(
              backgroundColor: isSelected ? Colors.blue : null,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              labelPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 4,
              ),
              label: Text(
                weather.hour,
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                  fontSize: 11,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
