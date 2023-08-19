import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/models/hourly.dart';
import "package:collection/collection.dart";

import '../../util/formatter.dart';

List<WeatherForecast> getWeatherForecast(Hourly hourly) {
  List<WeatherInfo> infoList = [];
  for (final (index, temp) in hourly.temperature.indexed) {
    String date = hourly.time[index];
    List<String> dateTime = date.split("T");
    infoList.add(WeatherInfo(
        date: getDateString(date),
        timeOfDay: dateTime[1],
        temperature: temp,
        weatherCode: hourly.weatherCode[index]));
  }
  List<WeatherForecast> newMap = groupBy(infoList, (p0) => p0.date)
      .entries
      .map((e) => WeatherForecast(
            date: e.key,
            weatherInfo: e.value,
          ))
      .toList();
  return newMap;
}
