import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/location/location_event.dart';
import 'package:flutter_weather_app/bloc/location/location_state.dart';

import '../../repositories/weather_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final WeatherRepository _weatherRepository;
  LocationBloc({
    required WeatherRepository locationRepository,
  })  : _weatherRepository = locationRepository,
        super(LocationStateLoading()) {
    on<LoadCurrentLocation>(_onLoadCurrentLocation);
    //on<LoadLocation>(_onLoadLocation);
    on<UpdateLocation>(_onUpdateLocation);
  }
  Future<void> _onLoadCurrentLocation(
      LoadCurrentLocation event, Emitter<LocationState> emit) async {
    final locationData = await _weatherRepository.getCurrentLocation();
    add(UpdateLocation(locationData));
  }

  // Future<void> _onLoadLocation(
  //     LoadLocation event, Emitter<LocationState> emit) async {
  //   final locationData = await _weatherRepository.getCurrentLocation();
  //   add(UpdateLocation(locationData));
  // }

  void _onUpdateLocation(UpdateLocation event, Emitter<LocationState> emit) {
    emit(LocationStateLoaded(event.location));
  }
}
