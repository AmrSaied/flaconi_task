import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_task/core/constants/api_constants.dart';

extension StringX on String? {
  String get weatherIconUrl =>
      "${ApiConstants.weatherIconEndpoint}$this@2x.png";

  String get orEmpty => this ?? '';

  String get dayOfDate => DateFormat('EEE').format(DateTime.parse(this!));

  String get fullDayOfDate => DateFormat('EEEE').format(DateTime.parse(this!));

  String get hours => DateFormat('hh a').format(DateTime.parse(this!));

  Color get weatherBgColor {
    switch (this) {
      case 'Clear':
        return Colors.lightBlueAccent;
      case 'Clouds':
        return Colors.blueGrey;
      case 'Rain':
        return Colors.grey;
      case 'Drizzle':
        return Colors.grey;
      case 'Thunderstorm':
        return Colors.black;
      case 'Snow':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}
