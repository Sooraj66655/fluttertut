import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/weather_forcast/model/weather_forecast_model.dart';
import 'package:tut/weather_forcast/util/weather_forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var cityName = snapshot.data!.city!.name;
  var countryName = snapshot.data!.city!.country;
  int? timeMilis = (forecastList![0].dt)! * 1000;
  var formateDate = new DateTime.fromMillisecondsSinceEpoch(timeMilis);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "$cityName,$countryName",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text("${Util.getFormattedDate(formateDate)}"),
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.wb_sunny,
            size: 196,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${forecastList[0].main!.temp!.toStringAsFixed(0)} °F",
                style: TextStyle(fontSize: 25),
              ),
              Text("${forecastList[0].weather![0].description!.toUpperCase()}"),
            ],
          ),
        ],
      ),
    ),
  );
  return midView;
}
