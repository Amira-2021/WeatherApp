import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_21_1_2024/data_layer/weather_model/weather_model.dart';
import 'package:weather_app_21_1_2024/data_layer/weather_model/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;

  Future<WeatherModel?> getWeatherDetails(String name) async {
    emit(WeatherDataDownloadingState());
    try {
      weatherModel = await WeatherService().getWeatherService(name);
      emit(WeatherDataDownloadedState());
      print("data is $weatherModel");
      return weatherModel;
    } catch (error) {
      emit(WeatherDataErrorState(error: error.toString()));
      return null;
    }
  }

  Color changeColorTheme(String status) {
    if (status == "Sunny") {
      return Colors.yellow.shade100;
    } else if (status == "Patchy rain nearby") {
      return Colors.blue.shade100;
    } else {
      return Colors.green.shade100;
    }
  }
}
