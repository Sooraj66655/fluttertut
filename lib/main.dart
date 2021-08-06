// import 'package:flutter/material.dart';
// import 'package:tut/ui/home.dart';

// final ThemeData _appTheme = _buildAppTheme();

// ThemeData _buildAppTheme() {
//   final ThemeData base = ThemeData.dark();

//   return base.copyWith(
//     brightness: Brightness.dark,
//     accentColor: Colors.amber,
//     primaryColor: Colors.green,
//     scaffoldBackgroundColor: Colors.red,
//     backgroundColor: Colors.amber,
//     textTheme: _appTextTheme(base.textTheme),
//   );
// }

// TextTheme _appTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         headline5: base.headline5!.copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//         headline6: base.headline6!.copyWith(
//           fontSize: 18.0,
//         ),
//         caption: base.caption!.copyWith(
//           fontWeight: FontWeight.bold,
//           fontSize: 14.0,
//         ),
//         bodyText2: base.bo dyText2!.copyWith(
//           fontSize: 17,
//           fontFamily: "Lobster",
//           color: Colors.white,
//         ),
//         button: base.button!.copyWith(
//             //fontSize: 23.9,
//             // backgroundColor: Colors.red,
//             ),
//       )
//       .apply(
//         fontFamily: "Lobster",
//         displayColor: Colors.amber,
//         //bodyColor: Colors.red,
//       );
// }

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: _appTheme,
//       // theme: ThemeData(
//       //     brightness: Brightness.dark,
//       //     primaryColor: Colors.grey[800],
//       //     textTheme: TextTheme(
//       //       headline5: TextStyle(
//       //         fontSize: 34,
//       //         fontWeight: FontWeight.bold,
//       //       ),
//       //       bodyText2: TextStyle(
//       //         fontSize: 15,
//       //       ),
//       //     )),
//       home: QuizApp(),
//     ),
//   );
// }

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:tut/ui/mortage_app.dart';
import 'package:tut/util/colors.dart';
import 'package:tut/weather_forcast/weather_forecast.dart';

final ThemeData _mortgageTheme = _buildMortgageTheme();

ThemeData _buildMortgageTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
      accentColor: primaryIndigoDark,
      primaryColor: primaryIndigo200,
      scaffoldBackgroundColor: secondaryBackgroundWhite,
      hintColor: textOnPrimaryBlack,
      cardColor: secondaryDeepPurple,
      textTheme: _buildMortgageTextTheme(base.textTheme),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryIndigoLight),
              borderRadius: BorderRadius.circular(12))),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          elevation: 7,
          splashColor: primaryIndigoLight,
          backgroundColor: secondaryDeepPurple));
}

_buildMortgageTextTheme(TextTheme base) {
  return base
      .copyWith(
        bodyText2: TextStyle(color: textOnPrimaryBlack, fontSize: 16),
      )
      .apply(
        fontFamily: "Lobster",
      );
}

void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _mortgageTheme,
        home: WeatherForecast(),
      ),
    );
