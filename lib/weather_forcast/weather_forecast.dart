import 'package:flutter/material.dart';
import 'package:tut/weather_forcast/model/weather_forecast_model.dart';
import 'package:tut/weather_forcast/network/network.dart';
import 'package:tut/weather_forcast/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel>? forcastObject;
  String? cityName = "Lucknow";
  @override
  void initState() {
    super.initState();
    forcastObject = getWeather(cityName);
    // forcastObject!.then((weather) => {
    //       print(weather.city!.country),
    //     });
  }

  Future<WeatherForecastModel> getWeather(cityName) =>
      Network().getWeatherForecast(cityName!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder(
              future: forcastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  //return Text("All Good");
                  return Column(
                    children: [
                      midView(snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            cityName = value;
            forcastObject = getWeather(cityName);
          });
        },
      ),
    );
  }
}
