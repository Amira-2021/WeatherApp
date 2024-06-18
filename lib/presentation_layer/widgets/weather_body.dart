import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_21_1_2024/business_logic_layer/get_weather_cubit/weather_cubit.dart';

class WeatherBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    var image = weatherModel.imageIcon.contains("https:")
        ? weatherModel.imageIcon
        : "https:${weatherModel.imageIcon}";
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: const [
          0.2,
          0.6,
          0.9,
        ],
        colors: [
          BlocProvider.of<WeatherCubit>(context)
              .changeColorTheme(weatherModel.status),
          Colors.white,
          Colors.grey,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Update at ${weatherModel.dateEpoch.hour}:${weatherModel.dateEpoch.minute} ",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "${weatherModel!.temp.toInt()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "maxTemp  ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "minTemp  ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.status,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
