class Weather{
  double temperature;
  String abbreviation;

  Weather({
    required this.temperature,
    required this.abbreviation,
});

  factory Weather.fromJson(Map json)=> Weather(
      temperature : json['the_temp'] as double,
      abbreviation : json['weather_state_abbr'].toString(),
    );
}