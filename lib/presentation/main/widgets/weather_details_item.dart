import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const WeatherDetailsItem(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Text(value),
      ],
    ).paddingAll(8);
  }
}
