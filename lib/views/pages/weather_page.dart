import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'locations_page.dart';

class WeatherPage extends StatelessWidget {
  static const String routeName = '/weather-page';

  static Route route({required Location location}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => WeatherPage(location: location),
    );
  }

  final Location location;
  const WeatherPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ]),
        ),
      ),
    );
  }
}
