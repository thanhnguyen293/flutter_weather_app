import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/location/location_event.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';

import '../../models/current_weather.dart';
import '../../models/weather.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherStateInitial()) {
    on<WeatherEventCurrentLocationRequested>(
        _onWeatherEventCurrentLocationRequested);
    on<WeatherEventAddLocation>(_onWeatherEventRequested);
    on<WeatherEventRefresh>(_onWeatherEventRefresh);
  }

  Future<void> _onWeatherEventCurrentLocationRequested(
    WeatherEventCurrentLocationRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherStateLoading());
    try {
      print('locationModel');
      final LocationModel locationModel =
          await weatherRepository.getCurrentLocation();
      print(locationModel);
      final Weather weather = await weatherRepository.getWeather(locationModel);
      final state = this.state;
      emit(WeatherStateSuccess(weather: List.from([])..add(weather)));
      // if (state is WeatherStateSuccess) {
      //   emit(WeatherStateSuccess(
      //       weather: List.from(state.weather)..add(weather)));
      // }
    } catch (e) {
      print('error');
      emit(WeatherStateFailure());
    }
  }

  Future<void> _onWeatherEventRequested(
    WeatherEventAddLocation event,
    Emitter<WeatherState> emit,
  ) async {
    //emit(WeatherStateLoading());
    try {
      final Weather weather =
          await weatherRepository.getWeather(event.locationModel);
      //emit(WeatherStateSuccess(weather: weather));
      final state = this.state;

      if (state is WeatherStateSuccess) {
        emit(WeatherStateSuccess(
            weather: List.from(state.weather)..add(weather)));
      } else {
        emit(WeatherStateSuccess(weather: List.from([])..add(weather)));
      }
    } catch (e) {
      emit(WeatherStateFailure());
    }
  }

  Future<void> _onWeatherEventRefresh(
    WeatherEventRefresh event,
    Emitter<WeatherState> emit,
  ) async {
    // try {
    //   final Weather weather =
    //       await weatherRepository.getWeatherFromCity(event.city);
    //   emit(WeatherStateSuccess(weather: weather));
    // } catch (e) {
    //   emit(WeatherStateFailure());
    // }
  }
}
