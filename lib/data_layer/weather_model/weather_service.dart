import 'package:dio/dio.dart';
import 'package:weather_app_21_1_2024/data_layer/weather_model/weather_model.dart';

class WeatherService {
  Dio dio = Dio();
  String baseUrl = "http://api.weatherapi.com/v1/forecast.json";
  String apiKey = "41375ad7869d4ecc9d1220916230108";
  String url =
      "http://api.weatherapi.com/v1/forecast.json?key=41375ad7869d4ecc9d1220916230108&q=London";

  Future<WeatherModel> getWeatherService(String cityName) async {
    try {
      final response = await dio.get("$baseUrl?key=$apiKey&q=$cityName");
      final jsonData = response.data;
      WeatherModel model = WeatherModel.fromJson(jsonData);
      return model;
    } on DioException catch (error) {
      final String? errMessage = error.response?.data["error"]["message"];
      throw (
        Exception(errMessage ?? "Oops there was an error ,please try again"),
      );
    }
  }
}
