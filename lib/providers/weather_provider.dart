import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_without_retrofit/models/city.dart';
import 'package:weather_without_retrofit/models/weather.dart';

class WeatherProvider{
  Future<Weather?> getWeatherForCity(City city) async {
    String apiUrl = "https://www.metaweather.com/api/location/"+city.woeid.toString();

    try{
      Response response = await Dio().get(apiUrl);
      if(response.statusCode==200){
        print(response.data);
        var json = response.data['consolidated_weather'][0];
        return Weather.fromJson(json);
      }

      return null;
    }catch (e) {
      print(e);
    }

    return null;
  }
}