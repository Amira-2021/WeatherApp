part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherDataDownloadedState extends WeatherState {}

class WeatherDataDownloadingState extends WeatherState {}

class WeatherDataErrorState extends WeatherState {
  String error;

  WeatherDataErrorState({required this.error});
}
