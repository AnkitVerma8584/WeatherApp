class WeatherInfo {
  final String date, timeOfDay;
  final double temperature;
  final int weatherCode;

  WeatherInfo(
      {required this.date,
      required this.timeOfDay,
      required this.temperature,
      required this.weatherCode});
}

class WeatherForecast {
  final String date;
  final List<WeatherInfo> weatherInfo;

  WeatherForecast({required this.date, required this.weatherInfo});
}
