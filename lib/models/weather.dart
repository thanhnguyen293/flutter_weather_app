import 'package:flutter/cupertino.dart';

class Weather {
  var temp;
  var tempMax;
  var tempMin;
  var lat;
  var long;
  var feelsLike;
  var pressure;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var cityName;

  Weather({
    this.temp,
    this.tempMax,
    this.tempMin,
    this.lat,
    this.long,
    this.feelsLike,
    this.pressure,
    this.description,
    this.currently,
    this.humidity,
    this.windSpeed,
    this.cityName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: json['lat'],
      long: json['lon'],
      temp: json['current']['temp'],
      feelsLike: json['current']['feels_like'],
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['speed'],
      description: json['weather'][0]['description'],
      currently: json['weather'][0]['main'],
      cityName: json['name'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
    );
  }
}
