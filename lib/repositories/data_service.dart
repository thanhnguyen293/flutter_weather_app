import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:http/http.dart' as http;

class DataService {
  List<Location> parseLocations(String responseBody) {
    //final parsed = jsonDecode(responseBody).
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Location>((json) => Location.fromJson(json)).toList();
  }

  Future<List<Location>> fetchLocations(String city) async {
    // final queryParameters = {
    //   'q': city,
    //   'limit': 5,
    //   'appid': 'c708d7b5fed66b7cead5e0d4ed0e2139',
    // };

    // final uri =
    //     Uri.https('api.openweathermap.org', '/geo/1.0/direct', queryParameters);

    final locationResponse = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=c708d7b5fed66b7cead5e0d4ed0e2139'),
    );

    return parseLocations(locationResponse.body);
  }

  // Future<void> getLocation(String city) async {
  //   //http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}
  //   //http://api.openweathermap.org/geo/1.0/direct?q=Ha%20Tinh&limit=5&appid=c708d7b5fed66b7cead5e0d4ed0e2139
  //   final queryParameters = {
  //     'q': city,
  //     'appid': 'c708d7b5fed66b7cead5e0d4ed0e2139',
  //     //'limit': 1,
  //   };

  //   final uri =
  //       Uri.https('api.openweathermap.org', '/geo/1.0/direct', queryParameters);

  //   final locationResponse = await http.get(uri); //await http.get(uri);
  //   print(locationResponse.body);
  //   //var tmp = locationResponse.body.
  //   //return Location.fromJson(locationResponse.body);
  //   //Location locations = Location.fromJson(locationResponse.body);
  // }
}
