import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:weather_task/core/constants/api_constants.dart';
import 'package:weather_task/core/error/failure.dart';

class NetworkService extends GetxService {
  late final Dio _dio;

  late final DioAdapter? dioAdapter;

  bool mock = false;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
      ),
    )..interceptors.addAll([
        LogInterceptor(
          responseBody: true,
        ),
      ]);
  }

  Future<Either<Failure, Response>> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (mock) {
        dioAdapter = DioAdapter(dio: _dio);
        final assetData = await rootBundle
            .loadString('assets/mocked_response/weather_success_response.json');
        final jsonData = json.decode(assetData);
        dioAdapter?.onGet(endpoint, (server) {
          server.reply(200, jsonData);
        });
      }
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return right(response);
    } on DioException catch (e) {
      return left(
        ApiFailure(message: e.message),
      );
    } catch (e) {
      return left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
