import 'package:flutter/material.dart';

import 'locations_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';

  static Route route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: const [
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
