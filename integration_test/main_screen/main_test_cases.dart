import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/extension/string_extension.dart';
import 'package:weather_task/domain/models/weather/climate_data.dart';
import 'package:weather_task/main.dart';
import 'package:weather_task/presentation/ui_models/weather_ui_Model.dart';

import '../mocked_classes/mocked.dart';
import 'main_screen_robot.dart';

class MainTestcases {
  Future<void> testIfAppTitleDisplayed() async {
    testWidgets('check if app title found', (tester) async {
      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();
      expect(find.text('Weather App'), findsOneWidget);
    });
  }

  Future<void> testIfWeatherDayForMainCardDisplayedIsCorrect() async {
    testWidgets(
        'Test success if day widget display the correct day and fails if empty or value is not correct',
        (tester) async {
      // mock weather repository
      final mockWeatherRepository = MockBaseWeatherRepository();

      // Read the JSON data from the asset file
      final assetData = await rootBundle
          .loadString('assets/mocked_response/weather_success_response.json');
      final jsonData = json.decode(assetData);

      final parsedResult = ClimateData.fromJson(jsonData);
      when(mockWeatherRepository.getWeatherInfo(lat: 42.0, long: -71.0))
          .thenAnswer((_) async => right(parsedResult));

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final dayFromResponse = parsedResult.data.first.dtTxt.fullDayOfDate;
      final dayWidgetText =
          tester.widget<Text>(MainScreenRobot(tester).day).data ?? "";
      expect(dayWidgetText, dayFromResponse);
    });
  }

  Future<void> testIfWeatherTempForMainCardDisplayedIsCorrect() async {
    testWidgets(
        'Test success if temperature widget display the correct temperature and fails if empty or value is not correct',
        (tester) async {
      // mock weather repository
      final mockWeatherRepository = MockBaseWeatherRepository();

      // Read the JSON data from the asset file
      final assetData = await rootBundle
          .loadString('assets/mocked_response/weather_success_response.json');
      final jsonData = json.decode(assetData);

      final parsedResult = ClimateData.fromJson(jsonData);
      when(mockWeatherRepository.getWeatherInfo(lat: 42.0, long: -71.0))
          .thenAnswer((_) async => right(parsedResult));

      final List<WeatherDataUiModel> weatherDataUiModels = [];
      final groupedResult =
          groupBy(parsedResult.data, (value) => value.dtTxt.fullDayOfDate);

      for (final day in groupedResult.keys) {
        weatherDataUiModels.add(
          WeatherDataUiModel.fromResponse(
            day,
            groupedResult[day]!,
            parsedResult.city!.name.orEmpty,
          ),
        );
      }

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final tempFromResponse =
          weatherDataUiModels.first.weatherDayList.first.tempC;
      final tempWidgetText =
          tester.widget<Text>(MainScreenRobot(tester).temperature).data ?? "";
      expect(tempWidgetText, tempFromResponse);
    });
  }

  Future<void> testIfWeatherHumidityForMainCardDisplayedIsCorrect() async {
    testWidgets(
        'Test success if humidity widget display the correct humidity and fails if empty or value is not correct',
        (tester) async {
      // mock weather repository
      final mockWeatherRepository = MockBaseWeatherRepository();

      // Read the JSON data from the asset file
      final assetData = await rootBundle
          .loadString('assets/mocked_response/weather_success_response.json');
      final jsonData = json.decode(assetData);

      final parsedResult = ClimateData.fromJson(jsonData);
      when(mockWeatherRepository.getWeatherInfo(lat: 42.0, long: -71.0))
          .thenAnswer((_) async => right(parsedResult));

      final List<WeatherDataUiModel> weatherDataUiModels = [];
      final groupedResult =
          groupBy(parsedResult.data, (value) => value.dtTxt.fullDayOfDate);

      for (final day in groupedResult.keys) {
        weatherDataUiModels.add(
          WeatherDataUiModel.fromResponse(
            day,
            groupedResult[day]!,
            parsedResult.city!.name.orEmpty,
          ),
        );
      }

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final humidityFromResponse =
          weatherDataUiModels.first.weatherDayList.first.humidity;
      final humidityWidgetText =
          tester.widget<Text>(MainScreenRobot(tester).humidity).data ?? "";
      expect(humidityWidgetText, humidityFromResponse);
    });
  }

  Future<void> testIfWeatherWindSpeedForMainCardDisplayedIsCorrect() async {
    testWidgets(
        'Test success if wind speed widget display the correct wind speed and fails if empty or value is not correct',
        (tester) async {
      // mock weather repository
      final mockWeatherRepository = MockBaseWeatherRepository();

      // Read the JSON data from the asset file
      final assetData = await rootBundle
          .loadString('assets/mocked_response/weather_success_response.json');
      final jsonData = json.decode(assetData);

      final parsedResult = ClimateData.fromJson(jsonData);
      when(mockWeatherRepository.getWeatherInfo(lat: 42.0, long: -71.0))
          .thenAnswer((_) async => right(parsedResult));

      final List<WeatherDataUiModel> weatherDataUiModels = [];
      final groupedResult =
          groupBy(parsedResult.data, (value) => value.dtTxt.fullDayOfDate);

      for (final day in groupedResult.keys) {
        weatherDataUiModels.add(
          WeatherDataUiModel.fromResponse(
            day,
            groupedResult[day]!,
            parsedResult.city!.name.orEmpty,
          ),
        );
      }

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final windSpeedFromResponse =
          weatherDataUiModels.first.weatherDayList.first.windSpeed;
      final windSpeedWidgetText =
          tester.widget<Text>(MainScreenRobot(tester).windSpeed).data ?? "";
      expect(windSpeedWidgetText, windSpeedFromResponse);
    });
  }

  Future<void> testIfChooseSpecificDateDisplayValidData() async {
    testWidgets(
        'Test success if data in main widget changed according to specific day selected',
        (tester) async {
      // mock weather repository
      final mockWeatherRepository = MockBaseWeatherRepository();

      // Read the JSON data from the asset file
      final assetData = await rootBundle
          .loadString('assets/mocked_response/weather_success_response.json');
      final jsonData = json.decode(assetData);

      final parsedResult = ClimateData.fromJson(jsonData);
      when(mockWeatherRepository.getWeatherInfo(lat: 42.0, long: -71.0))
          .thenAnswer((_) async => right(parsedResult));

      final List<WeatherDataUiModel> weatherDataUiModels = [];
      final groupedResult =
          groupBy(parsedResult.data, (value) => value.dtTxt.fullDayOfDate);

      for (final day in groupedResult.keys) {
        weatherDataUiModels.add(
          WeatherDataUiModel.fromResponse(
            day,
            groupedResult[day]!,
            parsedResult.city!.name.orEmpty,
          ),
        );
      }

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final dayFinder = find.byKey(const Key('Saturday'));
      tester.scrollUntilVisible(
        dayFinder,
        300,
        duration: const Duration(
          milliseconds: 300,
        ),
      );
      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      tester.tap(dayFinder);

      await tester.pumpWidget(const MyApp(
        isMock: true,
      ));
      await tester.pumpAndSettle();

      final humidityFromResponse =
       groupedResult['Friday']?.first.dtTxt.fullDayOfDate;

      final humidityWidgetText =
          tester.widget<Text>(MainScreenRobot(tester).windSpeed).data ?? "";
      expect(humidityWidgetText, humidityFromResponse);
    });
  }

  testAllCases() {
    group(
      'Weather App integration test cases',
      () {
        testIfAppTitleDisplayed();
        testIfWeatherDayForMainCardDisplayedIsCorrect();
        testIfWeatherTempForMainCardDisplayedIsCorrect();
        testIfWeatherHumidityForMainCardDisplayedIsCorrect();
        testIfWeatherWindSpeedForMainCardDisplayedIsCorrect();
        // testIfChooseSpecificDateDisplayValidData();
      },
    );
  }
}
