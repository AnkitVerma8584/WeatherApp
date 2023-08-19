import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_dto.dart';
import 'dart:convert';

Future<WeatherDTO> fetchWeather(Position position) async {
  // https://api.open-meteo.com/v1/forecast?latitude=22.5626&longitude=88.363&hourly=temperature_2m
  //https://api.open-meteo.com/v1/forecast?latitude=22.5626&longitude=88.363&hourly=temperature_2m,precipitation_probability,weathercode&daily=weathercode&current_weather=true&timezone=auto
  //https://api.open-meteo.com/v1/forecast?latitude=22.5626&longitude=88.363&hourly=temperature_2m,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=auto&forecast_days=1

  Map<String, String> queries = {
    "latitude": position.latitude.toString(),
    "longitude": position.longitude.toString(),
    "hourly": "temperature_2m,precipitation_probability,weathercode",
    "daily": "weathercode,precipitation_sum",
    "current_weather": "true",
    "timezone": "auto"
  };
  var url = Uri.https("api.open-meteo.com", '/v1/forecast', queries);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    var map = jsonDecode(response.body);
    WeatherDTO weatherDTO = WeatherDTO.fromJson(map);
    return weatherDTO;
  } else {
    switch (response.statusCode) {
      case 404:
        throw Exception('Page not found');
      default:
        throw Exception('Failed to load');
    }
  }
}
