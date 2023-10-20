import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherErrorWidget extends StatelessWidget {
  final String? message;
  final void Function() onRetry;
  const WeatherErrorWidget({
    super.key,
    this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text(
          message ?? 'Something Went Wrong',
          textAlign: TextAlign.center,
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 12,
        ),
        ElevatedButton(
          onPressed: onRetry,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
