import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_21_1_2024/presentation_layer/views/search_view.dart';
import 'package:weather_app_21_1_2024/presentation_layer/widgets/error_message.dart';
import 'package:weather_app_21_1_2024/presentation_layer/widgets/no_weather_body.dart';
import 'package:weather_app_21_1_2024/presentation_layer/widgets/weather_body.dart';

import '../../business_logic_layer/get_weather_cubit/weather_cubit.dart';

class HomeView extends StatelessWidget {
  HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'WeatherApp',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchView()));
                },
              ),
            ),
          ],
        ),
        body:
        BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherDataDownloadedState) {
            return WeatherBody();
          } else if (state is WeatherDataDownloadingState) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ));
          } else if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else {
            return ErrorMessage();
          }
        }));
  }
}
