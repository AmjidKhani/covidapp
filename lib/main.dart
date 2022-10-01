import 'package:flutter/material.dart';
import 'View/countries.dart';
import 'View/homepagre.dart';
import 'View/splash_screen.dart';
import 'View/viewspecificcountryinfo.dart';
import 'logicmethode/fetchingdatafromapi.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

