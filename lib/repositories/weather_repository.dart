import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://openweathermap.org/';
// ignore: prefer_function_declarations_over_variables
final locationUrl = (city) => '$baseUrl/api/location/search/?query=$city';
// ignore: prefer_function_declarations_over_variables
final weatherUrl = (locationId) => '$baseUrl/api/location/$locationId';

class WeatherRepository {
  final http.Client httpClient;
  WeatherRepository({required this.httpClient});
}
