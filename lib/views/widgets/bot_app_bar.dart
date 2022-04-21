import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/widgets/blur_effect.dart';

import '../pages/locations_page.dart';

class BotAppBar extends StatelessWidget {
  const BotAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurEffect(
      borderRadiusValue: 0,
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
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
