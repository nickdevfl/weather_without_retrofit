import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_without_retrofit/bloc/weather_event.dart';
import 'package:weather_without_retrofit/bloc/weather_state.dart';
import 'package:weather_without_retrofit/models/weather.dart';
import 'package:weather_without_retrofit/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherLoadingState()){
    on<WeatherLoadEvent>((WeatherLoadEvent event, emit) async{
      emit(WeatherLoadingState());
      try{
        final Weather? weather = await weatherRepository.getWeatherForCity(event.city);
        if (weather==null) {
          emit(WeatherErrorState());
        }else{
          emit(WeatherLoadedState(weather));
        }
      } catch(_){
        emit(WeatherErrorState());
      }
    });
  }
}