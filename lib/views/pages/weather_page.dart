import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  static const String routeName = '/weather-page';

  static Route route({required LocationModel location}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => WeatherPage(location: location),
    );
  }

  final LocationModel location;
  const WeatherPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<WeatherBloc>().add(WeatherStateSuccess(weather: DataService().getWeather(location)))

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
              child: Text(
                location.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
              return Text('Data');
            }),
          ]),
        ),
      ),
    );
  }
}
