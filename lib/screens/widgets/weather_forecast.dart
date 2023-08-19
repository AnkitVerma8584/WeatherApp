import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/widgets/temperature_graph.dart';
import '../../components/temp_card.dart';
import '../../models/weather_info.dart';

class WeatherForecastWidget extends StatefulWidget {
  const WeatherForecastWidget({
    super.key,
    required this.forecast,
  });

  final List<WeatherForecast> forecast;

  @override
  State<WeatherForecastWidget> createState() => _WeatherForecastWidgetState();
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  int currentIndex = 0;

  void onIncrease() {
    if (widget.forecast.length - 1 > currentIndex) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void onDecrease() {
    if (currentIndex != 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Opacity(
                    opacity: currentIndex != 0 ? 1.0 : 0.0,
                    child: IconButton(
                        onPressed: onDecrease,
                        icon:
                            const Icon(CupertinoIcons.arrow_left_circle_fill)),
                  ),
                  const Spacer(),
                  Text(widget.forecast[currentIndex].date),
                  const Spacer(),
                  Opacity(
                    opacity:
                        currentIndex != widget.forecast.length - 1 ? 1.0 : 0.0,
                    child: IconButton(
                        onPressed: onIncrease,
                        icon:
                            const Icon(CupertinoIcons.arrow_right_circle_fill)),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            TemperatureGraph(data: widget.forecast[currentIndex].weatherInfo),
            const SizedBox(height: 24),
            SizedBox(
              height: 140,
              child: ListView.builder(
                  itemCount: widget.forecast[currentIndex].weatherInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    WeatherInfo info =
                        widget.forecast[currentIndex].weatherInfo[index];
                    return TemperatureCard(info: info);
                  }),
            )
          ],
        ));
  }
}
