import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_21_1_2024/presentation_layer/my_theme.dart';
import 'package:weather_app_21_1_2024/presentation_layer/views/home.dart';
import 'package:weather_app_21_1_2024/presentation_layer/weather_bloc_observer.dart';

import 'business_logic_layer/get_weather_cubit/weather_cubit.dart';

void main() {
  runApp(MyApp());
  Bloc.observer = WeatherBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        theme: CustomLightTheme.lightTheme,
      ),
    );
  }
}
