import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../models/weather_dto.dart';
import '../../util/weather_type.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.data,
    required this.type,
  });

  final WeatherDTO data;
  final WeatherType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: GradientText(
              "${data.currentWeather.temperature}°",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              colors: const [
                Colors.white,
                Colors.white54,
                Colors.white24,
                Colors.transparent
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            child: SvgPicture.asset(
              type.icon,
              height: 150,
              width: double.infinity,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 16,
              child: Column(
                children: [
                  const Text("Wind",
                      style: TextStyle(fontSize: 11, color: Colors.white70)),
                  Text("${data.currentWeather.windSpeed} km/hr"),
                ],
              )),
          Positioned(
              right: 16,
              bottom: 0,
              child: Column(
                children: [
                  const Text("Elevation",
                      style: TextStyle(fontSize: 11, color: Colors.white70)),
                  Text("${data.elevation} m"),
                ],
              ))
        ],
      ),
    );
  }
}
