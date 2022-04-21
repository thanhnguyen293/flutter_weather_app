import 'package:flutter/material.dart';

class DailyWeather {
  var tempMax;
  var tempMin;
  var icon;
  var date;
  var description;

  DailyWeather({
    required this.tempMax,
    required this.tempMin,
    required this.icon,
    required this.date,
    required this.description,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMax: json['temp']['max'],
      tempMin: json['temp']['min'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
    );
  }
}
