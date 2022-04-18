import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_without_retrofit/bloc/weather_bloc.dart';
import 'package:weather_without_retrofit/repositories/weather_repository.dart';
import 'package:weather_without_retrofit/screens/cities_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final weatherRepository = WeatherRepository();


  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository),
      child:MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CitiesScreen(),
      ),
    );

  }
}

