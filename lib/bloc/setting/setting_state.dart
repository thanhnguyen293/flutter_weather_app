part of 'setting_bloc.dart';

enum TemperatureUnit { fahrenheit, celsius }

class SettingState extends Equatable {
  final TemperatureUnit temperatureUnit;

  const SettingState({required this.temperatureUnit});

  @override
  List<Object?> get props => [temperatureUnit];
}
