import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/bloc/location/location_event.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:location/location.dart';

class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationStateLoading extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationStateLoaded extends LocationState {
  final LocationModel location;
  const LocationStateLoaded(this.location);

  @override
  List<Object?> get props => [location];
}
