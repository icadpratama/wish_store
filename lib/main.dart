import 'package:flutter/material.dart';
import 'package:wish_store/pages/splash_screen.dart';
import 'package:wish_store/pages/login_screen.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
};

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: Color(0xFFFF5722), accentColor: Color(0xFFFF9800),
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  routes: routes,
));