part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherEventRequested extends WeatherEvent {
  final String city;
  const WeatherEventRequested({required this.city});

  @override
  List<Object?> get props => [city];
}

class WeatherEventRefresh extends WeatherEvent {
  final String city;
  const WeatherEventRefresh({required this.city});

  @override
  List<Object?> get props => [city];
}