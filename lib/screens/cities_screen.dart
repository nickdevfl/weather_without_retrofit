import 'package:flutter/material.dart';
import 'package:weather_without_retrofit/app_style.dart';
import 'package:weather_without_retrofit/models/city.dart';
import 'package:weather_without_retrofit/repositories/cities_repository.dart';
import 'package:weather_without_retrofit/widgets/list_button_widget.dart';

class CitiesScreen extends StatelessWidget {
  List<City> items = CitiesRepository().getAll();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppStyle.listBtnBgColor,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return ListButtonWidget(items[index]);
        },
      ),
    );
  }
}
