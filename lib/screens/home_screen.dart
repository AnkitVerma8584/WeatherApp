import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/temp_card.dart';
import 'package:weather_app/models/weather_dto.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/screens/widgets/current_weather.dart';
import 'package:weather_app/screens/widgets/temperature_graph.dart';
import 'package:weather_app/services/mapper/dto_to_weather.dart';
import 'package:weather_app/util/weather_type.dart';
import '../components/bottom_nav.dart';
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
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherDTO>(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            if (!snapshot.hasData) {
              return const Center(child: Text("Failed to load data"));
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
        });
  }
}

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
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentIndex != 0)
                IconButton(
                    onPressed: onDecrease,
                    icon: const Icon(CupertinoIcons.arrow_left_circle_fill)),
              Text(widget.forecast[currentIndex].date),
              if (currentIndex != widget.forecast.length - 1)
                IconButton(
                    onPressed: onIncrease,
                    icon: const Icon(CupertinoIcons.arrow_right_circle_fill)),
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
