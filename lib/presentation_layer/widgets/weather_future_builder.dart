import 'package:flutter/material.dart';
import 'package:weather_app_21_1_2024/data_layer/weather_model/weather_model.dart';
import 'package:weather_app_21_1_2024/presentation_layer/widgets/weather_body.dart';

class WeatherFutureBuilder extends StatefulWidget {
  WeatherModel? weatherModel;
  String cityName;

  WeatherFutureBuilder({required this.weatherModel, required this.cityName});

  @override
  State<WeatherFutureBuilder> createState() => _WeatherFutureBuilderState();
}

class _WeatherFutureBuilderState extends State<WeatherFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WeatherModel>(
        initialData: widget.weatherModel,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Container(
                color: Colors.white,
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50,
                  child: Text(
                    "Please check again 😊",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            return WeatherBody();
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
          );
        });
  }
}
