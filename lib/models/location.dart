enum LocationType {
  city,
  state,
  province,
  country,
  continent,
}

class Coord {
  final double lat;
  final double lon;
  const Coord({
    required this.lat,
    required this.lon,
  });
}

class LocationModel {
  final String name;
  final Coord coord;
  final String country;
  final String localName;
  final String? state;

  LocationModel({
    required this.name,
    required this.country,
    required this.coord,
    required this.localName,
    this.state,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] as String,
      coord: Coord(
        lat: json['lat'] as double,
        lon: json['lon'] as double,
      ),
      // lat: json['lat'] as double,
      // lon: json['lon'] as double,
      localName: json['local_names']['vi'] ?? json['local_names']['en'],
      country: json['country'] as String,
      state: json['state'],
    );
  }
}
