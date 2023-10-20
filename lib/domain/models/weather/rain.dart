class Rain {
  final double? the1H;

  const Rain({
    this.the1H,
  });

  Rain copyWith({
    double? the1H,
  }) =>
      Rain(
        the1H: the1H ?? this.the1H,
      );

  factory Rain.fromJson(dynamic json) => Rain(the1H: json?['1h']);
}
