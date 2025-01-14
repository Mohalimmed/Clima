class WeatherModel {
  String getWeatherIcon(int condition) {
    // Map of condition codes to their corresponding symbols
    final weatherIcons = {
      113: '☀️', // Clear/Sunny
      116: '⛅', // Partly Cloudy
      119: '☁️', // Cloudy
      122: '☁️', // Overcast
      143: '🌫️', // Mist
      200: '⛈️', // Thundery outbreaks in nearby
      227: '🌨️', // Blowing snow
      230: '❄️', // Blizzard
      248: '🌫️', // Fog
      260: '🌫️', // Freezing fog
      263: '🌧️', // Patchy light drizzle
      266: '🌧️', // Light drizzle
      281: '🌧️❄️', // Freezing drizzle
      284: '🌧️❄️', // Heavy freezing drizzle
      293: '🌧️', // Patchy light rain
      296: '🌧️', // Light rain
      299: '🌧️', // Moderate rain at times
      302: '🌧️', // Moderate rain
      305: '🌧️', // Heavy rain at times
      308: '🌧️', // Heavy rain
      311: '🌧️❄️', // Light freezing rain
      314: '🌧️❄️', // Moderate or Heavy freezing rain
      317: '🌧️❄️', // Light sleet
      320: '🌧️❄️', // Moderate or heavy sleet
      323: '🌨️', // Patchy light snow
      326: '🌨️', // Light snow
      329: '🌨️', // Patchy moderate snow
      332: '🌨️', // Moderate snow
      335: '❄️', // Patchy heavy snow
      338: '❄️', // Heavy snow
      350: '🌧️❄️', // Ice pellets
      353: '🌧️', // Light rain shower
      356: '🌧️', // Moderate or heavy rain shower
      359: '🌧️', // Torrential rain shower
      362: '🌧️❄️', // Light sleet showers
      365: '🌧️❄️', // Moderate or heavy sleet showers
      368: '🌨️', // Light snow showers
      371: '🌨️', // Moderate or heavy snow showers
      374: '🌧️❄️', // Light showers of ice pellets
      377: '🌧️❄️', // Moderate or heavy showers of ice pellets
      386: '⛈️', // Patchy light rain in area with thunder
      389: '⛈️', // Moderate or heavy rain in area with thunder
      392: '🌨️⛈️', // Patchy light snow in area with thunder
      395: '🌨️⛈️', // Moderate or heavy snow in area with thunder
      800: '☀️', // Clear
      801: '☁️', // Few clouds
      802: '☁️', // Scattered clouds
      803: '☁️', // Broken clouds
      804: '☁️', // Overcast clouds
    };

    // Return the corresponding symbol or '🤷‍' for unknown conditions
    return weatherIcons[condition] ?? '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
