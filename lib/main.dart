import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/location/location_bloc.dart';
import 'package:flutter_weather_app/bloc/location/location_event.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/location_repository.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';
import 'package:flutter_weather_app/views/pages/locations_page.dart';
import 'package:flutter_weather_app/views/pages/weather_page.dart';
import 'package:http/http.dart' as http;

import 'bloc/bloc_observer.dart';
import 'views/pages/home_page/home_page.dart';

void main() {
  return BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: WeatherBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WeatherBloc(weatherRepository: WeatherRepository()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(locationRepository: WeatherRepository())
              ..add(LoadLocation()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return HomePage.route();
              case '/weather-page':
                return WeatherPage.route(
                    location: settings.arguments as LocationModel);
              case '/locations-page':
                return LocationsPage.route();
            }
          },
        ));
  }
}
