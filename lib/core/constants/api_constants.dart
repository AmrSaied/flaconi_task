class ApiConstants {
  const ApiConstants._();
  static const String baseUrl = 'https://api.openweathermap.org/';
  static const String apiKey = '6094723fd9911867d11a1314db3d0154';

  static const String currentWeatherEndpoint =
      'data/2.5/forecast?appid=$apiKey';
  static const String weatherIconEndpoint =
      'https://openweathermap.org/img/wn/';
}
