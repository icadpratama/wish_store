import 'package:flutter/material.dart';
import 'package:wish_store/pages/splash_screen.dart';
import 'package:wish_store/pages/intro_screen.dart';
import 'package:wish_store/pages/home_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: Color(0xFFFF5722), accentColor: Colors.yellowAccent
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  routes: routes,
));