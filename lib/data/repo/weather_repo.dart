import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/core/dio_helper.dart';

import '../model/weather_model.dart';

class WeatherRepo{

  static Future<WeatherModel> weatherData(String q) async{
    final Response response = await DioHelper.getData(url: '', query: {
      'key' : Constants.apiKey,
      'q' : q
    });
    debugPrint('WEATHER DATA : $response');
    WeatherModel request = WeatherModel.fromJson(response.data);
    return request;
  }
}