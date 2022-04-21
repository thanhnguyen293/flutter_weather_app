import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/location/location_event.dart';
import 'package:flutter_weather_app/bloc/location/location_state.dart';
import 'package:flutter_weather_app/repositories/location_repository.dart';

import '../../repositories/weather_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final WeatherRepository _locationRepository;
  LocationBloc({
    required WeatherRepository locationRepository,
  })  : _locationRepository = locationRepository,
        super(LocationStateLoading()) {
    on<LoadLocation>(_onLoadLocation);
    on<UpdateLocation>(_onUpdateLocation);
  }
  Future<void> _onLoadLocation(
      LoadLocation event, Emitter<LocationState> emit) async {
    final locationData = await _locationRepository.getCurrentLocation();
    add(UpdateLocation(locationData));
  }

  void _onUpdateLocation(UpdateLocation event, Emitter<LocationState> emit) {
    emit(LocationStateLoaded(event.location));
  }
}
