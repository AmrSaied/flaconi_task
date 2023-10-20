class LocationData {
  final String? name;
  final Map<String, String>? localNames;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;

  const LocationData({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  LocationData copyWith({
    String? name,
    Map<String, String>? localNames,
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) =>
      LocationData(
        name: name ?? this.name,
        localNames: localNames ?? this.localNames,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        country: country ?? this.country,
        state: state ?? this.state,
      );

  factory LocationData.fromJson(dynamic json) => LocationData(
        name: json['name'],
        country: json['country'],
        lat: json['lat'],
        localNames: json['local_names'],
        lon: json['lon'],
        state: json['state'],
      );
}
