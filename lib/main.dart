import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../bloc/location/location_bloc.dart';
import '../../bloc/location/location_event.dart';
import '../../bloc/weather/weather_bloc.dart';
import '../../models/location.dart';
import '../../repositories/weather_repository.dart';
import '../../views/pages/locations_page.dart';
import 'bloc/bloc_observer.dart';
import 'views/pages/home_page.dart';

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

              case '/locations-page':
                return LocationsPage.route();
            }
          },
        ));
  }
}
