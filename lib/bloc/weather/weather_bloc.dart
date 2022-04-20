import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/repositories/weather_repository.dart';

import '../../models/weather.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherStateInitial()) {
    on<WeatherEventRequested>(_onWeatherEventRequested);
    on<WeatherEventRefresh>(_onWeatherEventRefresh);
  }

  Future<void> _onWeatherEventRequested(
    WeatherEventRequested event,
    Emitter<WeatherState> emit,
  ) async {
    // emit(WeatherStateLoading());
    // try {
    //   final Weather weather =
    //       await weatherRepository.getWeatherFromCity(event.city);
    //   emit(WeatherStateSuccess(weather: weather));
    // } catch (e) {
    //   emit(WeatherStateFailure());
    // }
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
