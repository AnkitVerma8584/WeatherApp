class CurrentWeather {
  final double temperature, windSpeed;
  final int windDirection, weatherCode;
  final String time;
  final bool isDay;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: json['temperature'],
      windSpeed: json['windspeed'],
      windDirection: json['winddirection'],
      weatherCode: json['weathercode'],
      time: json['time'],
      isDay: json['is_day'] == 1,
    );
  }

  CurrentWeather(
      {required this.temperature,
      required this.windSpeed,
      required this.windDirection,
      required this.weatherCode,
      required this.time,
      required this.isDay});
}
