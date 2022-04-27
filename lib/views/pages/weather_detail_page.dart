import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/widgets/title_text.dart';
import 'package:location/location.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../models/weather.dart';
import '../widgets/blur_effect.dart';
import '../widgets/seven_day_weather.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({
    Key? key,
    required this.weather,
    required this.image,
  }) : super(key: key);

  final Weather weather;
  final String image;

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TitleText(
                text: weather.locationModel.name,
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
              TitleText(
                text: weather.currentWeather.temp.round().toString() + '°C',
                fontSize: 80,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              TitleText(
                text: weather.currentWeather.description[0].toUpperCase() +
                    weather.currentWeather.description.substring(
                        1, weather.currentWeather.description.length),
                color: Colors.black87,
                fontSize: 20,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(
                    text: 'T: ${weather.currentWeather.tempMin.round()}°',
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 10),
                  TitleText(
                    text: 'C: ${weather.currentWeather.tempMax.round()}°',
                    color: Colors.black87,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                children: [
                  weatherInfo(
                    icon: const BoxedIcon(
                      WeatherIcons.celsius,
                      size: 40,
                    ),
                    title: 'Cảm nhận',
                    value: weather.currentWeather.feelsLike.round().toString() +
                        '°C',
                  ),
                  weatherInfo(
                      title: 'Độ ẩm',
                      icon: const BoxedIcon(WeatherIcons.humidity, size: 30),
                      value: weather.currentWeather.humidity.toString() + '%'),
                  weatherInfo(
                    title: 'Tốc độ gió',
                    icon: const BoxedIcon(
                      WeatherIcons.windy,
                      size: 30,
                    ),
                    value: weather.currentWeather.windSpeed.toString() + ' m/s',
                  ),
                  weatherInfo(
                    title: 'Tầm nhìn',
                    icon: const Icon(
                      Icons.visibility,
                      size: 30,
                    ),
                    value: (weather.currentWeather.visibility / 1000)
                            .round()
                            .toString() +
                        ' km',
                  ),
                  weatherInfo(
                    title: 'Áp suất',
                    icon: const BoxedIcon(
                      WeatherIcons.direction_down,
                      size: 30,
                    ),
                    value: weather.currentWeather.pressure.toString() + ' hPa',
                  ),
                  weatherInfo(
                      title: 'Chỉ số UV',
                      icon: const BoxedIcon(WeatherIcons.umbrella),
                      value: weather.currentWeather.uvi.round().toString()
                      //+ ' '
                      // +
                      // (weather.currentWeather.uvi <= 2
                      //     ? '(Thấp)'
                      //     : weather.currentWeather.uvi <= 5
                      //         ? '(Trung Bình)'
                      //         : weather.currentWeather.uvi <= 7
                      //             ? '(Cao)'
                      //             : weather.currentWeather.uvi <= 10
                      //                 ? '(Rất Cao)'
                      //                 : '(Cực Cao)')
                      )
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlurEffect(
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            TitleText(
                              text: 'Dự báo 7 ngày',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 0,
                      ),
                      SizedBox(
                        //height: 400,
                        // child: ListView(
                        //   children: [
                        //     SevenDayWeather(
                        //       divider: true,
                        //       title: 'Today',
                        //       date: weather.dailyWeather[0].date,
                        //       icon: weather.dailyWeather[0].icon,
                        //       tempMax: weather.dailyWeather[0].tempMax.round(),
                        //       tempMin: weather.dailyWeather[0].tempMin.round(),
                        //     ),
                        //   ],
                        // ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return SevenDayWeather(
                              divider: index < weather.dailyWeather.length - 1,
                              title: weather.dailyWeather[index].main,
                              date: weather.dailyWeather[index].date,
                              icon: weather.dailyWeather[index].icon,
                              tempMax:
                                  weather.dailyWeather[index].tempMax.round(),
                              tempMin:
                                  weather.dailyWeather[index].tempMin.round(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Padding weatherInfo(
      {required String title, required Widget icon, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: BlurEffect(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 30,
                child: icon,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    TitleText(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
