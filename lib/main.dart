import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/binding/app_binding.dart';
import 'package:weather_task/presentation/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool isMock;

  const MyApp({super.key, this.isMock = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather Task',
      enableLog: true,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(isMock: isMock),
      home: const MainScreen(),
    );
  }
}
