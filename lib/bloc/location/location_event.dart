import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:location/location.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class LoadLocation extends LocationEvent {
  @override
  List<Object?> get props => [];
}

class UpdateLocation extends LocationEvent {
  final LocationModel location;
  const UpdateLocation(this.location);

  @override
  List<Object?> get props => [location];
}
