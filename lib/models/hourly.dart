class Hourly {
  final List<String> time;
  final List<double> temperature;
  final List<int> weatherCode;

  Hourly(
      {required this.time,
      required this.temperature,
      required this.weatherCode});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
        time: json['time'].cast<String>(),
        temperature: json['temperature_2m'].cast<double>(),
        weatherCode: json['weathercode'].cast<int>());
  }
}
