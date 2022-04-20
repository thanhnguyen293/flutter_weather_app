import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';
import 'package:flutter_weather_app/views/pages/locations_page.dart';
import 'package:flutter_weather_app/views/pages/weather_page.dart';
import 'package:http/http.dart' as http;

import 'bloc/bloc_observer.dart';

void main() {
  return BlocOverrides.runZoned(
    () async {
      final WeatherRepository weatherRepository =
          WeatherRepository(httpClient: http.Client());
      {
        runApp(const MyApp());
      }
    },
    blocObserver: WeatherBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
      routes: {
        LocationsPage.routeName: (context) => const LocationsPage(),
      },
    );
  }
}
