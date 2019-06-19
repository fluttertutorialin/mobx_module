import 'package:flutter/material.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/splash/splash_page.dart';
import 'ui/pages/home/home_page.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashPage(),
    login: (BuildContext context) => LoginPage(),
    home: (BuildContext context) => HomePage(),
  };
}



