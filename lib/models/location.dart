enum LocationType {
  city,
  state,
  province,
  country,
  continent,
}

class Location {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      country: json['country'] as String,
      state: json['state'] as String,
    );
  }
}
