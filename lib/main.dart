import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx_module/routes.dart';
import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: HomePage(),
    );
  }
}