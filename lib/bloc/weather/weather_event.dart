part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherEventRequested extends WeatherEvent {
  final Coord coord;
  const WeatherEventRequested({required this.coord});

  @override
  List<Object?> get props => [coord];
}

class WeatherEventRefresh extends WeatherEvent {
  final Weather weather;
  const WeatherEventRefresh({required this.weather});

  @override
  List<Object?> get props => [weather];
}
