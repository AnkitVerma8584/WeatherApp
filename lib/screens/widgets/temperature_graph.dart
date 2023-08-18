import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';
import 'package:weather_app/models/weather_info.dart';

class TemperatureGraph extends StatelessWidget {
  const TemperatureGraph({
    super.key,
    required this.data,
  });

  final List<WeatherInfo> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LineChart(
        LineChartData(
            lineTouchData: const LineTouchData(enabled: false),
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 23,
            minY: minBy(data, (p0) => p0.temperature)?.temperature,
            maxY: maxBy(data, (p0) => p0.temperature)?.temperature,
            lineBarsData: [
              LineChartBarData(
                  barWidth: 5,
                  dotData: const FlDotData(show: false),
                  isCurved: true,
                  spots: List.generate(
                      data.length,
                      (index) =>
                          FlSpot(index.toDouble(), data[index].temperature)))
            ]),
      ),
    );
  }
}
