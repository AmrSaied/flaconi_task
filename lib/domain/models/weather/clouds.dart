class Clouds {
  final int? all;

  const Clouds({
    this.all,
  });

  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  factory Clouds.fromJson(dynamic json) => Clouds(all: json['all']);
}
