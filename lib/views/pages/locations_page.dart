import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/data_service.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);
  static String routeName = '/locations-page';

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  TextEditingController textEditingController = TextEditingController();
  List<Location> location = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Weather',
      //     style: TextStyle(fontSize: 26),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.black,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Text('Add Location'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0x73B4B4B4),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'search',
                    // hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    //fillColor: Colors.red,
                  ),
                  controller: textEditingController,
                  onChanged: (String value) async {
                    location = await DataService().fetchLocations(value);
                    setState(() {});
                  },
                ),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 600,
                  child: ListView.builder(
                    itemCount: location.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.black12,
                        child: Text(location[index].name +
                            ", " +
                            location[index].state.toString() +
                            ", " +
                            location[index].country),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
