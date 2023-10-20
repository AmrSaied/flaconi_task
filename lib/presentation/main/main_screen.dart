import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_task/presentation/main/controllers/main_controller.dart';
import 'package:weather_task/presentation/main/widgets/error_widget.dart';
import 'package:weather_task/presentation/main/widgets/loading_widget.dart';
import 'package:weather_task/presentation/main/widgets/main_weather_card.dart';
import 'package:weather_task/presentation/main/widgets/unit_dropdown.dart';
import 'package:weather_task/presentation/main/widgets/weather_card_item.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Weather App',
          ),
          centerTitle: true,
        ),
        body: SmartRefresher(
          enablePullDown: true,
          onRefresh: controller.onRefresh,
          controller: controller.refreshController,
          child: controller.obx(
            (weatherDataUIModels) {
              final selectedWeather = controller.selectedWeather;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    UnitsDropDown(
                      onChanged: controller.setTempUnit,
                      value: controller.tempUnit,
                    ),
                    if (selectedWeather != null)
                      MainWeatherCard(
                        tempUnit: controller.tempUnit,
                        selectedWeatherUIModel: selectedWeather,
                        onChipTapped: (index) {
                          controller.onSelectWeather(
                            selectedWeather.copyWith(
                              selectedIndex: index,
                            ),
                          );
                        },
                      ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: weatherDataUIModels
                                ?.map(
                                  (weatherDataUIModel) => WeatherCardItem(
                                    onTap: () => controller.onSelectWeather(
                                      weatherDataUIModel,
                                    ),
                                    weatherDataUiModel: weatherDataUIModel,
                                    tempUnit: controller.tempUnit,
                                  ),
                                )
                                .toList() ??
                            const <Widget>[],
                      ),
                    ),
                  ],
                ),
              );
            },
            onLoading: const LoadingWidget(),
            onError: (error) => WeatherErrorWidget(
              message: error,
              onRetry: controller.onRefresh,
            ),
          ),
        ),
      ),
    );
  }
}
