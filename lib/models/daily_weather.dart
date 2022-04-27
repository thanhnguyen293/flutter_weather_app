import 'package:flutter/material.dart';

class DailyWeather {
  var tempMax;
  var tempMin;
  var icon;
  var date;
  var main;

  DailyWeather({
    required this.tempMax,
    required this.tempMin,
    required this.icon,
    required this.date,
    required this.main,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      tempMax: json['temp']['max'],
      tempMin: json['temp']['min'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
    );
  }
}
