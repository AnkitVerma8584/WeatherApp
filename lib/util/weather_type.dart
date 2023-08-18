class WeatherType {
  final String weather;
  final String icon;
  WeatherType(this.weather, this.icon);
}

WeatherType getWeatherType(int code) {
  switch (code) {
    case 0:
      return WeatherType("Clear Sky", "assets/weather/day.svg");
    case 1:
      return WeatherType("Mainly clear", "assets/weather/cloudy-day-1.svg");
    case 2:
      return WeatherType("Partly cloudy", "assets/weather/cloudy-day-2.svg");
    case 3:
      return WeatherType("Overcast", "assets/weather/WeatherIcon - 1-57.svg");
    case 45:
      return WeatherType("Fog", "assets/weather/cloudy.svg");
    case 48:
      return WeatherType("Depositing rime fog", "assets/weather/cloudy.svg");
    case 51:
      return WeatherType("Drizzle light", "assets/weather/rainy-1.svg");
    case 53:
      return WeatherType("Moderate drizzle", "assets/weather/rainy-2.svg");
    case 55:
      return WeatherType("Dense drizzle", "assets/weather/rainy-3.svg");
    case 56:
      return WeatherType("Light freezing drizzle", "assets/weather/");
    case 57:
      return WeatherType("Dense freezing drizzle", "assets/weather/");
    case 61:
      return WeatherType("Slight rain", "assets/weather/rainy-5.svg");
    case 63:
      return WeatherType("Moderate rain", "assets/weather/rainy-6.svg");
    case 65:
      return WeatherType("Heavy rain", "assets/weather/rainy-7.svg");
    case 66:
      return WeatherType("Light freezing rain", "assets/weather/snowy-1.svg");
    case 67:
      return WeatherType("Heavy freezing rain", "assets/weather/snowy-2.svg");
    case 71:
      return WeatherType("Slight snowfall", "assets/weather/snowy-4.svg");
    case 73:
      return WeatherType("Moderate snowfall", "assets/weather/snowy-5.svg");
    case 75:
      return WeatherType("Heavy snowfall", "assets/weather/snowy-6.svg");
    case 77:
      return WeatherType("Snow grains", "assets/weather/");
    case 80:
      return WeatherType("Slight rain showers", "assets/weather/");
    case 81:
      return WeatherType("Moderate rain showers", "assets/weather/");
    case 82:
      return WeatherType("Violen rain showers", "assets/weather/thunder.svg");
    case 85:
      return WeatherType("Slight snow shower", "assets/weather/");
    case 86:
      return WeatherType("Heavy snow shower", "assets/weather/");
    case 95:
      return WeatherType("Thunderstorm", "assets/weather/");
    case 96:
      return WeatherType("Thunderstorm with slight hail", "assets/weather/");
    case 99:
      return WeatherType("Thunderstorm with heavy hail", "assets/weather/");
    default:
      return WeatherType("Clear Sky", "assets/weather/day.svg");
  }
}
