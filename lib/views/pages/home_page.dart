import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/constains.dart';
import 'package:flutter_weather_app/views/pages/weather_detail_page.dart';
import 'package:location/location.dart';

import '../../bloc/location/location_bloc.dart';
import '../../bloc/location/location_state.dart';
import '../../bloc/weather/weather_bloc.dart';
import '../../cubit/bottom_app_bar/home_cubit.dart';
import '../../models/location.dart';
import '../widgets/blur_effect.dart';
import '../widgets/bot_app_bar.dart';
import '../widgets/seven_day_weather.dart';
import '../widgets/title_text.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Location location = Location();
    context
        .read<WeatherBloc>()
        .add(const WeatherEventCurrentLocationRequested());
    //final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    final PageController pageController = PageController();
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherStateSuccess) {
            return PageView.builder(
              itemCount: state.weather.length,
              onPageChanged: (value) {
                //selectedTab = value;
              },
              itemBuilder: (context, index) {
                return WeatherDetailPage(
                  weather: state.weather[index],
                  image: MapString.mapStringToIcon(
                      state.weather[index].currentWeather.main),
                );
              },
              controller: pageController,
            );
          } else {
            return const Text('Add location');
          }
        },
      ),
      bottomNavigationBar:const BotAppBar(),
    );

    //   return Scaffold(
    //     body: Container(
    //       width: double.infinity,
    //       decoration: const BoxDecoration(
    //         //color: Color.fromARGB(255, 36, 237, 255),
    //         image: DecorationImage(
    //             image: AssetImage('assets/images/cloud.jpeg'), fit: BoxFit.cover),
    //       ),
    //       child: SafeArea(
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: <Widget>[
    //               const SizedBox(height: 20),
    //               //_locationName(),
    //               _weather(),
    //               // Spacer(
    //               //   flex: 1,
    //               // )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     bottomNavigationBar: const BotAppBar(),
    //   );
    // }

    // _weather() {
    //   return SizedBox(
    //     width: double.infinity,
    //     height: 1000,
    //     child: BlocBuilder<WeatherBloc, WeatherState>(
    //       builder: (context, state) {
    //         if (state is WeatherStateLoading) {
    //           return const CircularProgressIndicator();
    //         } else if (state is WeatherStateSuccess) {
    //           return Column(
    //             children: [
    //               Column(
    //                 children: [
    //                   _currentWeather(
    //                     temp: '${(state.weather.currentWeather.temp).round()}°C',
    //                     description: state.weather.currentWeather.description,
    //                     tempMin: state.weather.currentWeather.tempMin
    //                         .round()
    //                         .toString(),
    //                     tempMax: state.weather.currentWeather.tempMax
    //                         .round()
    //                         .toString(),
    //                   ),
    //                   const SizedBox(
    //                     height: 20,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 20),
    //                     child: BlurEffect(
    //                       color: Colors.black12,
    //                       child: SizedBox(
    //                         height: 80,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                           children: [
    //                             _weatherInfo(
    //                               title: 'Độ ẩm',
    //                               value: state.weather.currentWeather.humidity
    //                                       .toString() +
    //                                   '%',
    //                               icon: Image.asset(
    //                                 'assets/icons/humidity.png',
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                             const VerticalDivider(
    //                               color: Colors.black,
    //                               indent: 25,
    //                               endIndent: 25,
    //                             ),
    //                             _weatherInfo(
    //                               icon: Image.asset(
    //                                 'assets/icons/uv_index.png',
    //                                 color: Colors.white,
    //                               ),
    //                               title: 'Chỉ số UV',
    //                               value:
    //                                   state.weather.currentWeather.uvi.toString(),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   GridView.count(
    //                     padding: const EdgeInsets.symmetric(horizontal: 15),
    //                     shrinkWrap: true,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     crossAxisCount: 2,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.all(5),
    //                         child: _uvIndex(state),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(5),
    //                         child: BlurEffect(
    //                           color: Colors.blue,
    //                           child: Padding(
    //                             padding: const EdgeInsets.symmetric(vertical: 10),
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Row(
    //                                   children: const [
    //                                     Icon(
    //                                       Icons.device_thermostat,
    //                                       size: 16,
    //                                     ),
    //                                     Text(' Cảm nhận'),
    //                                   ],
    //                                 ),
    //                                 Text(
    //                                   state.weather.currentWeather.feelsLike
    //                                           .round()
    //                                           .toString() +
    //                                       '°',
    //                                   style: const TextStyle(
    //                                     fontSize: 50,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               _sevenDayWeather(state),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //             ],
    //           );
    //         } else {
    //           return const Text('Error');
    //         }
    //       },
    //     ),
    //   );
    // }

    // Row _weatherInfo({
    //   required Widget icon,
    //   required String title,
    //   required String value,
    // }) {
    //   return Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         height: 50,
    //         child: icon,
    //       ),
    //       const SizedBox(width: 10),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           TitleText(
    //             text: title,
    //             fontWeight: FontWeight.w700,
    //           ),
    //           const SizedBox(height: 5),
    //           TitleText(
    //             text: value,
    //             fontSize: 22,
    //             color: Colors.white,
    //           )
    //         ],
    //       ),
    //     ],
    //   );
    // }

    // BlurEffect _uvIndex(WeatherStateSuccess state) {
    //   return BlurEffect(
    //     color: Colors.blue,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 10),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: const [
    //               Icon(
    //                 Icons.sunny,
    //                 size: 16,
    //               ),
    //               Text(' Chỉ số UV'),
    //             ],
    //           ),
    //           Text(
    //             state.weather.currentWeather.uvi.toString(),
    //             style: const TextStyle(
    //               fontSize: 50,
    //               //backgroundColor: Colors.red,
    //             ),
    //           ),
    //           const Spacer(),
    //           TitleText(
    //             text: state.weather.currentWeather.uvi <= 2
    //                 ? 'Thấp'
    //                 : state.weather.currentWeather.uvi <= 5
    //                     ? 'Trung Bình'
    //                     : state.weather.currentWeather.uvi <= 7
    //                         ? 'Cao'
    //                         : state.weather.currentWeather.uvi <= 10
    //                             ? 'Rất cao'
    //                             : 'Cực cao',
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // // _locationName() {
    // //   return SizedBox(
    // //     height: 40,
    // //     child: BlocBuilder<LocationBloc, LocationState>(
    // //       builder: (context, state) {
    // //         if (state is LocationStateLoading) {
    // //           return const CircularProgressIndicator();
    // //         } else if (state is LocationStateLoaded) {
    // //           context.read<WeatherBloc>().add(
    // //                 WeatherEventRequested(
    // //                     locationModel: Coord(
    // //                   lat: state.location.coord.lat,
    // //                   lon: state.location.coord.lon,
    // //                 )),
    // //               );
    // //           return Text(
    // //             state.location.localName ?? 'null',
    // //             style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
    // //           );
    // //         } else {
    // //           return const Text('Error');
    // //         }
    // //       },
    // //     ),
    // //   );
    // // }

    // Column _currentWeather({
    //   required String temp,
    //   required String description,
    //   required String tempMin,
    //   required String tempMax,
    // }) {
    //   return Column(
    //     children: [
    //       TitleText(
    //         text: temp,
    //         fontSize: 80,
    //         fontWeight: FontWeight.w300,
    //         color: Colors.black87,
    //       ),
    //       TitleText(
    //         text: description[0].toUpperCase() +
    //             description.substring(1, description.length),
    //         color: Colors.black87,
    //         fontSize: 20,
    //       ),
    //       const SizedBox(height: 5),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           TitleText(
    //             text: 'T: $tempMin°',
    //             color: Colors.black87,
    //           ),
    //           const SizedBox(width: 10),
    //           TitleText(
    //             text: 'C: $tempMax°',
    //             color: Colors.black87,
    //           ),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    // _sevenDayWeather(WeatherStateSuccess state) {
    //   return Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: BlurEffect(
    //       color: Colors.black12,
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: Row(
    //               children: const [
    //                 Icon(
    //                   Icons.calendar_month,
    //                   color: Colors.white,
    //                 ),
    //                 SizedBox(width: 10),
    //                 TitleText(
    //                   text: 'Dự báo 7 ngày',
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.w500,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Divider(
    //             thickness: 1,
    //             height: 0,
    //           ),
    //           ListView.builder(
    //             physics: const NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount: state.weather.dailyWeather.length,
    //             itemBuilder: (context, index) {
    //               return SevenDayWeather(
    //                 divider: index < state.weather.dailyWeather.length - 1,
    //                 title: state.weather.dailyWeather[index].main,
    //                 date: state.weather.dailyWeather[index].date,
    //                 icon: state.weather.dailyWeather[index].icon,
    //                 tempMax: state.weather.dailyWeather[index].tempMax.round(),
    //                 tempMin: state.weather.dailyWeather[index].tempMin.round(),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }

  void _onTappedBar(int value) {
    // Provider.of<BottomNavigationBarProvider>(context, listen: false).currentIndex = value;
    // _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
