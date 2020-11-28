import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/utils/images.dart';
import '../constants/config.dart';

class Location {
  final double lat;
  final double long;
  Location({@required this.lat, @required this.long});
}

class WeatherData {
  final String city;
  final int temperature;
  final String description;
  final String icon;

  WeatherData({
    this.city,
    this.temperature,
    this.description,
    this.icon,
  });
}

class Weather with ChangeNotifier {
  WeatherData _weather;

  WeatherData get weather {
    return _weather;
  }

  Future<void> getWeather() async {
    final Location location = await getCurrentLocation();

    try {
      String url =
          "$baseURL/weather?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric";
      var res = await http.get(url);
      var data = jsonDecode(res.body);
      _weather = WeatherData(
        city: data['name'],
        description: data['weather'][0]['description'],
        temperature: data['main']['temp'].round(),
        icon: codeToIcon(data['weather'][0]['id']),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  FutureOr<Location> getCurrentLocation() async {
    try {
      Position location = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return Location(lat: location.latitude, long: location.longitude);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
