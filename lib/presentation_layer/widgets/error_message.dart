import 'package:flutter/material.dart';
import 'package:weather_app_21_1_2024/presentation_layer/views/search_view.dart';

class ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(50),
      title: const Text("Oops please search again 😊"),
      actions: [
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchView()));
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 90,
                height: 40,
                child: const Center(
                  child: Text(
                    "continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))),
      ],
    );
  }
}
