import 'package:flutter/material.dart';
import 'package:sfframework/constant/routes_uri.dart';
import 'package:sfframework/view/firebase_home.dart';
import 'package:sfframework/view/home_page.dart';
import 'package:sfframework/view/splash_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
    HOME: (BuildContext context) => firebasePage() // HomePage(
    // title: 'Frame Work',
    /// )
  };
}
