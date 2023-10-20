class Coord {
  final num? lon;
  final num? lat;

  const Coord({
    this.lon,
    this.lat,
  });


  factory Coord.fromJson(dynamic json) => Coord(
        lat: json['lat'],
        lon: json['lon'],
      );
}
