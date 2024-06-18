class WeatherModel {
  final String cityName;
  final DateTime dateEpoch;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String status;
  final String imageIcon;

  WeatherModel({
    required this.cityName,
    required this.dateEpoch,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.status,
    required this.imageIcon,
  });

  factory WeatherModel.fromJson(jsonData) {
    final jsonOfOneDay = jsonData["forecast"]["forecastday"][0];
    final day = jsonOfOneDay["day"];
    return WeatherModel(
      cityName: jsonData["location"]["name"],
      dateEpoch: DateTime.parse(jsonData["current"]["last_updated"]),
      temp: day["avgtemp_c"],
      maxTemp: day["maxtemp_c"],
      minTemp: day["mintemp_c"],
      status: day["condition"]["text"],
      imageIcon: day["condition"]["icon"],
    );
  }
}
