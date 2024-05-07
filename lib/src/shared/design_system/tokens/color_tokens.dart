import 'package:flutter/material.dart';

class ColorTokens {
  static const Color black = Color(0xFF131418);
  static const Color inputBackground = Color(0xFF23252C);
  static const Color lightGray = Color(0xFF6C6D7A);
  static const Color darkGray = Color(0xFF555252);
  static const Color gray = Color.fromRGBO(168, 69, 82, 0.2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white_20 = Color.fromRGBO(244, 244, 244, 0.2);
  static const Color white_33 = Color.fromRGBO(255, 255, 255, 0.33);
  static const Color white_45 = Color.fromRGBO(255, 255, 255, 0.45);
  static const Color purple = Color(0xFFAA73F0);
  static const Color purple_20 = Color.fromRGBO(188, 76, 241, 0.2);
  static const Color supportDangerMain = Color(0xFFFF5151);
  static const Color shadow = Color.fromRGBO(241, 204, 76, 0.2);

  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorTokens.black,
    onPrimary: ColorTokens.white_45,
    secondary: ColorTokens.white_45,
    onSecondary: ColorTokens.gray,
    error: ColorTokens.white_45,
    onError: ColorTokens.supportDangerMain,
    background: ColorTokens.white_45,
    onBackground: ColorTokens.white_45,
    surface: ColorTokens.white_45,
    onSurface: ColorTokens.white_45,
    shadow: ColorTokens.shadow,
  );
}
