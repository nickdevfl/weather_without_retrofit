import 'package:flutter/material.dart';
import 'package:weather_without_retrofit/models/city.dart';
import 'package:weather_without_retrofit/models/weather.dart';
import 'package:weather_without_retrofit/providers/weather_provider.dart';

class WeatherRepository{
  Future<Weather?> getWeatherForCity(City city) async{
    return WeatherProvider().getWeatherForCity(city);
  }
}


