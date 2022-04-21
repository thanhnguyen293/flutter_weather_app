import 'dart:convert';

import 'package:flutter_weather_app/models/daily_weather.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/current_weather.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

const String apiKey = '0e33001fefb04906699414ec485fe978';

class WeatherRepository {
  Future<LocationModel> getCurrentLocation() async {
    LocationData location = await Location().getLocation();
    final locationResponse = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=${location.latitude}&lon=${location.longitude}&limit=1&appid=$apiKey'));

    final json = jsonDecode(locationResponse.body);
    //print(json);

    return LocationModel(
      name: json[0]['name'] as String,
      country: json[0]['country'] as String,
      localName: json[0]['local_names']['vi'] ?? json[0]['local_names']['en'],
      coord:
          Coord(lat: json[0]['lat'] as double, lon: json[0]['lon'] as double),
    );
  }

  List<LocationModel> parseLocations(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<LocationModel>((json) => LocationModel.fromJson(json))
        .toList();
  }

  Future<List<LocationModel>> fetchLocations(String city) async {
    final locationResponse = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=$apiKey'));
    //print(locationResponse.body);

    return parseLocations(locationResponse.body);
  }

  List<DailyWeather> parseDailyWeather(List responseBody) {
    //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    List<DailyWeather> dailyWeathers = [];
    for (var element in responseBody) {
      dailyWeathers.add(DailyWeather.fromJson(element));
    }

    return dailyWeathers;
  }

  Future<Weather> getWeather(Coord coord) async {
    final http.Response weatherResponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${coord.lat}&lon=${coord.lon}&lang=vi&units=metric&exclude=minutely,hourly&appid=$apiKey'));

    final json = jsonDecode(weatherResponse.body) as Map<String, dynamic>;
    // print(json);

    return Weather(
        currentWeather: CurrentWeather.fromJson(json),
        dailyWeather: parseDailyWeather(json['daily']));
  }
}
