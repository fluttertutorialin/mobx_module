import 'package:flutter/material.dart';
import 'package:mobx_module/constants/strings.dart';

final ThemeData themeData = new ThemeData(
  fontFamily: Strings.font_quick_sand,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.blue[500].value, AppColors.blue),
  primaryColor: AppColors.blue[500],
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.blue[500],
  accentColorBrightness: Brightness.light,
);

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Map<int, Color> blue = const <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  };

  static List<Color> gradientsColorSignUp = [
    Colors.grey.shade200,
    Colors.grey.shade400,
  ];

  static List<Color> gradientsColorFloatForm = [
    Colors.grey.shade200,
    Colors.grey.shade100,
  ];
}
