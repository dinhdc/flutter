import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

import 'location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = Uri.https(DOMAIN, unencodedPath,
        {"APPID": API_KEY, "units": "metric", "q": cityName});
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.fetchData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    var url = Uri.https(DOMAIN, unencodedPath, {
      "lat": "${location.latitude}",
      "lon": "${location.longitude}",
      "APPID": API_KEY,
      "units": "metric"
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.fetchData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
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
