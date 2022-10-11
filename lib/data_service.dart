import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'fa9fbb146e0125da1c85fa278a4646e4',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
