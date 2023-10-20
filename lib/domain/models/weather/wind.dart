class Wind {
  final num? speed;
  final int? deg;
  final num? gust;

  const Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust,
      );

  factory Wind.fromJson(dynamic json) => Wind(
        deg: json['deg'],
        gust: json['gust'],
        speed: json['speed'],
      );
}
