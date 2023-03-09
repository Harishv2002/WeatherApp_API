import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '74a53e8ded7e1c3ff1b78943292e6e3a';
const openWeatherApiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  late double latitude;
  late double longitude;

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherApiURL?q=$cityName&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String cityData = response.body;
      print(cityData);

      var jsonCityDecodedData = jsonDecode(cityData);
      return jsonCityDecodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location obj = Location();
    await obj.getCurrentLocation();
    latitude = obj.latitude;
    longitude = obj.longitude;
    String url =
        '$openWeatherApiURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var jsonDecodedData = jsonDecode(data);
      return jsonDecodedData;
    } else {
      print(response.statusCode);
    }
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
