class WeatherType {
  final String weather;
  final String icon;
  WeatherType(this.weather, this.icon);
}

WeatherType getWeatherType(int code) {
  switch (code) {
    case 0:
      return WeatherType("Clear Sky", "assets/weather/clear_sky.svg");
    case 1:
      return WeatherType("Mainly clear", "assets/weather/mainly_clear.svg");
    case 2:
      return WeatherType("Partly cloudy", "assets/weather/partly_cloudy.svg");
    case 3:
      return WeatherType("Overcast", "assets/weather/overcast.svg");
    case 45:
      return WeatherType("Fog", "assets/weather/fog.svg");
    case 48:
      return WeatherType("Depositing rime fog", "assets/weather/fog_rime.svg");
    case 51:
      return WeatherType(
          "Drizzle light", "assets/weather/moderate_drizzle.svg");
    case 53:
      return WeatherType(
          "Moderate drizzle", "assets/weather/moderate_drizzle.svg");
    case 55:
      return WeatherType("Dense drizzle", "assets/weather/dense_drizzle.svg");
    case 56:
      return WeatherType("Light freezing drizzle",
          "assets/weather/light_freezing_drizzle.svg");
    case 57:
      return WeatherType("Dense freezing drizzle",
          "assets/weather/dense_freezing_drizzle.svg");
    case 61:
      return WeatherType("Slight rain", "assets/weather/light_rain.svg");
    case 63:
      return WeatherType("Moderate rain", "assets/weather/moderate_rain.svg");
    case 65:
      return WeatherType("Heavy rain", "assets/weather/heavy_rain.svg");
    case 66:
      return WeatherType(
          "Light freezing rain", "assets/weather/freezing_rain_light.svg");
    case 67:
      return WeatherType(
          "Heavy freezing rain", "assets/weather/freezing_rain_dense.svg");
    case 71:
      return WeatherType(
          "Slight snowfall", "assets/weather/slight_snowfall.svg");
    case 73:
      return WeatherType(
          "Moderate snowfall", "assets/weather/moderate_snowfall.svg");
    case 75:
      return WeatherType("Heavy snowfall", "assets/weather/heavy_snowfall.svg");
    case 77:
      return WeatherType("Snow grains", "assets/weather/snow_grain.svg");
    case 80:
      return WeatherType(
          "Slight rain showers", "assets/weather/slight_rain_shower.svg");
    case 81:
      return WeatherType(
          "Moderate rain showers", "assets/weather/slight_rain_shower.svg");
    case 82:
      return WeatherType(
          "Violen rain showers", "assets/weather/violent_rain_shower.svg");
    case 85:
      return WeatherType(
          "Slight snow shower", "assets/weather/slight_snow_shower.svg");
    case 86:
      return WeatherType(
          "Heavy snow shower", "assets/weather/heavy_snow_shower.svg");
    case 95:
      return WeatherType("Thunderstorm", "assets/weather/thunderstorm.svg");
    case 96:
      return WeatherType("Thunderstorm with slight hail",
          "assets/weather/thunderstorm_light_hail.svg");
    case 99:
      return WeatherType("Thunderstorm with heavy hail",
          "assets/weather/thunderstorm_heavy_hail.svg");
    default:
      return WeatherType("Clear Sky", "assets/weather/clear_sky.svg");
  }
}
