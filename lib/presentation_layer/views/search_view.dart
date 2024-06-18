import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic_layer/get_weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                onSubmitted: (input) async {
                  controller.text = input;
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherDetails(input);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.black,
                  labelText: "search",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 22,
                  ),
                  enabledBorder: outLineInputStyle(),
                  disabledBorder: outLineInputStyle(),
                  focusedBorder: outLineInputStyle(),
                  focusedErrorBorder: outLineInputStyle(
                    colors: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  log("input is ${controller.text}");
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherDetails(controller.text);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}

OutlineInputBorder outLineInputStyle({Color colors = Colors.deepPurple}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: colors),
  );
}
