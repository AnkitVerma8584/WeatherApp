import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_dto.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/screens/widgets/current_weather.dart';
import 'package:weather_app/screens/widgets/weather_forecast.dart';
import 'package:weather_app/services/mapper/dto_to_weather.dart';
import 'package:weather_app/util/weather_type.dart';
import '../services/server/weather_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 0, 140, 255),
              Color.fromARGB(255, 1, 103, 186),
              Color.fromARGB(255, 0, 135, 245),
            ])),
        child: const Scaffold(
          body: SafeArea(child: HomePage()),
          backgroundColor: Colors.transparent,
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<WeatherDTO>(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              if (!snapshot.hasData) {
                return Center(child: Text(snapshot.error.toString()));
              }
              var data = snapshot.data!;
              var type = getWeatherType(data.currentWeather.weatherCode);
              List<WeatherForecast> forecast = getWeatherForecast(data.hourly);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    data.timezone,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    type.weather,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  CurrentWeatherWidget(data: data, type: type),
                  const SizedBox(height: 16),
                  WeatherForecastWidget(forecast: forecast)
                ],
              );
            }
          }),
    );
  }
}
