import 'package:flutter/cupertino.dart';

class CurrentWeather {
  var sunrise;
  var sunset;
  var temp;
  var feelsLike;
  var pressure;
  var humidity;
  var dewPoint;
  var tempMax;
  var tempMin;
  var cloulds;
  var uvi;
  var visibility;
  var windSpeed;
  var windDeg;
  var description;
  var main;

  CurrentWeather({
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.tempMax,
    this.tempMin,
    this.cloulds,
    this.uvi,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.description,
    this.main,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      sunrise: json['current']['sunrise'],
      sunset: json['current']['sunset'],
      temp: json['current']['temp'],
      feelsLike: json['current']['feels_like'],
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      dewPoint: json['current']['dew_point'],
      tempMax: json['daily'][0]['temp']['max'],
      tempMin: json['daily'][0]['temp']['min'],
      cloulds: json['current']['cloulds'],
      uvi: json['current']['uvi'],
      visibility: json['current']['visibility'],
      windDeg: json['current']['wind_deg'],
      windSpeed: json['current']['wind_speed'],
      description: json['current']['weather'][0]['description'],
      main: json['current']['weather'][0]['main'],
    );
  }
}
