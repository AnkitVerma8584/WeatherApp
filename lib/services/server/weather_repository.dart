import 'package:weather_app/models/weather_dto.dart';
import 'package:weather_app/services/location/my_location.dart';
import 'package:weather_app/services/server/weather_api.dart';

import '../location/current_location.dart';

Future<WeatherDTO> getCurrentWeather() async {
  MyLocation location = await getCurrentLocation();
  if (location.position != null) {
    return await fetchWeather(
        latitude: location.position!.latitude,
        longitude: location.position!.longitude);
  } else {
    return await fetchWeather();
  }
}
