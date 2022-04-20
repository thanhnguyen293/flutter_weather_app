import 'package:flutter_weather_app/models/weather.dart';

class Forecast {
  final DateTime lastUpdated;
  final double longitude;
  final double latitude;
  final List<Weather> daily;
  final Weather current;
  final bool isDayTime;
  String city;

  Forecast({
    required this.lastUpdated,
    required this.longitude,
    required this.latitude,
    this.daily = const [],
    required this.current,
    required this.city,
    required this.isDayTime,
  });
}
