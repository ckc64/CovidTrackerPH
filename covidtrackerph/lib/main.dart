import 'package:covidtrackerph/dashboard.dart';
import 'package:covidtrackerph/splashscreen.dart';
import 'package:covidtrackerph/testingpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PH Based Covid Tracker',
    debugShowCheckedModeBanner: false,
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.grey,
    fontFamily: 'Montserrat-Regular'
  ),
     //home: TestingPages(),
      home: SplashScreenFull(),
    );
  }
}
