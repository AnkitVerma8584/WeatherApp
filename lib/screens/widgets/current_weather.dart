import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../models/weather_dto.dart';
import '../../util/weather_type.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.data,
    required this.type,
  });

  final WeatherDTO data;
  final WeatherType type;

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween<Offset>(
          begin: Offset.zero, end: const Offset(0, 0.08))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
              "${widget.data.currentWeather.temperature}°",
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
            top: 90,
            child: SlideTransition(
              position: _animation,
              child: SvgPicture.asset(
                widget.type.icon,
                height: 170,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 16,
              child: Column(
                children: [
                  const Text("Wind",
                      style: TextStyle(fontSize: 11, color: Colors.white70)),
                  Text("${widget.data.currentWeather.windSpeed} km/hr"),
                ],
              )),
          Positioned(
              right: 16,
              bottom: 0,
              child: Column(
                children: [
                  const Text("Elevation",
                      style: TextStyle(fontSize: 11, color: Colors.white70)),
                  Text("${widget.data.elevation} m"),
                ],
              ))
        ],
      ),
    );
  }
}
