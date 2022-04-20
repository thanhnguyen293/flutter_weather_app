import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/pages/locations_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Weather App'),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {
      //         //Navigate to Settings Screen
      //       },
      //       icon: const Icon(Icons.settings),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         //navigate to City Search Screen
      //       },
      //       icon: const Icon(Icons.search),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Text('Ho Chi Minh City'),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
            ),
            const Text('Location'),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LocationsPage.routeName);
              },
              icon: const Icon(Icons.menu),
            )
          ],
        ),
      ),
    );
  }
}
