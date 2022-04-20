import 'dart:convert';

import 'package:flutter_weather_app/models/location.dart';
import 'package:http/http.dart' as http;

const String apiKey = 'c708d7b5fed66b7cead5e0d4ed0e2139';

class DataService {
  List<Location> parseLocations(String responseBody) {
    //final parsed = jsonDecode(responseBody).
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Location>((json) => Location.fromJson(json)).toList();
  }

  Future<List<Location>> fetchLocations(String city) async {
    final locationResponse = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=$apiKey'));

    return parseLocations(locationResponse.body);
  }

  Future<void> getWeather(Location location) async {
    final weatherReponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.lat}&lon=${location.lon}&exclude=daily&appid=$apiKey'));
  }
}
