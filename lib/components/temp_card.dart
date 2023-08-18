import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/util/weather_type.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({super.key, required this.info});
  final WeatherInfo info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(info.timeOfDay, style: const TextStyle(color: Colors.grey)),
          SvgPicture.asset(
            getWeatherType(info.weatherCode).icon,
            height: 50,
          ),
          Text(
            "${info.temperature}°C",
            style: const TextStyle(color: Colors.grey),
          )
        ]),
      ),
    );
  }
}
