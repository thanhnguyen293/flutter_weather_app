import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);
  static const String routeName = '/locations-page';

  static Route route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LocationsPage(),
    );
  }

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  TextEditingController textEditingController = TextEditingController();
  List<LocationModel> locations = [];

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: const Color(0x73B4B4B4),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'search location',
              border: InputBorder.none,
            ),
            controller: textEditingController,
            // onChanged: (String value) async {
            //   locations = await WeatherRepository().fetchLocations(value);
            //   setState(() {});
            // },
            onSubmitted: (String value) async {
              locations = await WeatherRepository().fetchLocations(value);
              setState(() {});
            },
          ),
        ),
        //centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child:
            // ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  (locations[index].name) +
                                      ", " +
                                      (locations[index].state ?? '') +
                                      "${locations[index].state == null ? '' : ', '} " +
                                      locations[index].country,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<WeatherBloc>().add(
                                      WeatherEventAddLocation(
                                          locationModel: locations[index]));
                                },
                                child: const Text(
                                  'Add',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
