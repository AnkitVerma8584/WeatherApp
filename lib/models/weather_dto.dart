import 'current_weather.dart';
import 'hourly.dart';

class WeatherDTO {
  final double latitude;
  final double longitude;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeather currentWeather;
  final Hourly hourly;

  WeatherDTO(
      {required this.latitude,
      required this.longitude,
      required this.timezone,
      required this.timezoneAbbreviation,
      required this.elevation,
      required this.currentWeather,
      required this.hourly});

  factory WeatherDTO.fromJson(Map<String, dynamic> json) {
    return WeatherDTO(
        latitude: json['latitude'],
        longitude: json['longitude'],
        timezone: json['timezone'],
        timezoneAbbreviation: json['timezone_abbreviation'],
        elevation: json['elevation'],
        currentWeather: CurrentWeather.fromJson(json['current_weather']),
        hourly: Hourly.fromJson(json['hourly']));
  }
}
