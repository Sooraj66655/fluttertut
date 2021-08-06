import 'dart:convert';
import 'package:http/http.dart';
import 'package:tut/weather_forcast/model/weather_forecast_model.dart';
import 'package:tut/weather_forcast/util/weather_forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(String cityName) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/?q=" +
        cityName +
        "&cnt=7&appid=" +
        Util.appId +
        "&units=imperial";
    final response = await get(Uri.parse(finalUrl));
    print("URL : ${Uri.parse(finalUrl)}");
    if (response.statusCode == 200) {
      print("Weather : data ${response.body}");
      return WeatherForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather forcast");
    }
  }
}
