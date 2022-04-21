import 'package:flutter_weather_app/models/current_weather.dart';
import 'package:flutter_weather_app/models/daily_weather.dart';

class Weather {
  CurrentWeather currentWeather;
  List<DailyWeather> dailyWeather;
  Weather({
    required this.currentWeather,
    required this.dailyWeather,
  });

  // factory Weather.fromJson(Map<String, dynamic> json) {
  //   List<DailyWeather> dailyWeathers = [];

  //   return Weather(
  //       currentWeather: CurrentWeather.fromJson(json),
  //       dailyWeather: dailyWeather);
  // }
}
