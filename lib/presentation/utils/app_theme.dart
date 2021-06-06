import 'package:flutter/material.dart';

class AppTheme {
  static const Color scaffoldColor = Color(0xfff5f5f5);
  static const Color deepBlue = Color(0xff3f3a58);
  static const Color lightPurple = Color(0xff918ac8);
  static const Color grey = Color(0xffa3a1ae);
  static const Color deepOrange = Color(0xfffa543b);

  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    color: deepBlue,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 26,
    color: deepBlue,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    color: deepBlue,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle text1 = TextStyle(
    fontSize: 16,
    color: grey,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle text2 = TextStyle(
    fontSize: 14,
    color: grey,
    fontWeight: FontWeight.w500,
  );

  static List<BoxShadow> getShadow(Color color) {
    return [
      BoxShadow(
        color: color.withOpacity(0.3),
        offset: Offset(0, 6),
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ];
  }
}
