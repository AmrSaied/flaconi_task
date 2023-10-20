class MainData {
  final num? temp;
  final num? feelsLike;
  final num? tempMin;
  final num? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  const MainData({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  MainData copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) =>
      MainData(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        seaLevel: seaLevel ?? this.seaLevel,
        grndLevel: grndLevel ?? this.grndLevel,
      );

  factory MainData.fromJson(dynamic json) => MainData(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        grndLevel: json['grnd_level'],
        humidity: json['humidity'],
        pressure: json['pressure'],
        seaLevel: json['sea_level'],
        tempMax: json['temp_max'],
        tempMin: json['temp_min'],
      );
}
