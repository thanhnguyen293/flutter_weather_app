import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/widgets/title_text.dart';
import 'package:intl/intl.dart';

class SevenDayWeather extends StatelessWidget {
  const SevenDayWeather({
    required this.date,
    required this.icon,
    required this.tempMax,
    required this.tempMin,
    required this.title,
    this.divider = true,
    Key? key,
  }) : super(key: key);

  final date;
  final int tempMax;
  final int tempMin;
  final String title;
  final String icon;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              child: TitleText(
                text: DateFormat('EEE').format(date),
              ),
            ),
            //const SizedBox(width: 20),

            SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                  child: Image.network(
                      'http://openweathermap.org/img/wn/${icon}@2x.png')),
            ),
            //Image.network('http://openweathermap.org/img/wn/${icon}.png'),
            TitleText(
              text: '$tempMin - $tempMax°C',
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: TitleText(
                text: title[0].toUpperCase() +
                    title.substring(
                      1,
                      title.length,
                    ),
              ),
            ),
          ],
        ),
        divider
            ? const Divider(
                thickness: 1,
                height: 0,
              )
            : const SizedBox(),
      ],
    );
  }
}
