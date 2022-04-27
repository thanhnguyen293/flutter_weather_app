part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherEventCurrentLocationRequested extends WeatherEvent {
  const WeatherEventCurrentLocationRequested();
}

class WeatherEventAddLocation extends WeatherEvent {
  final LocationModel locationModel;
  const WeatherEventAddLocation({required this.locationModel});

  @override
  List<Object?> get props => [locationModel];
}

class WeatherEventRefresh extends WeatherEvent {
  final Weather weather;
  const WeatherEventRefresh({required this.weather});

  @override
  List<Object?> get props => [weather];
}
