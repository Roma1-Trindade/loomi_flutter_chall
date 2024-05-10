import 'package:flutter/material.dart';

class ColorTokens {
  static const Color black = Color(0xFF131418);
  static const Color inputBackground = Color(0xFF23252C);
  static const Color lightGray = Color(0xFF6C6D7A);
  static const Color darkGray = Color(0xFF555252);
  static const Color gray = Color.fromRGBO(168, 69, 82, 0.2);
  static const Color divider = Color.fromRGBO(217, 217, 217, 0.2);
  static const Color cardTextColor = Color(0xFFD9DADE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFDEDEDE);
  static const Color white_10 = Color.fromRGBO(187, 187, 187, 0.1);
  static const Color white_20 = Color.fromRGBO(244, 244, 244, 0.2);
  static const Color white_33 = Color.fromRGBO(255, 255, 255, 0.33);
  static const Color white_45 = Color.fromRGBO(255, 255, 255, 0.45);
  static const Color white_60 = Color.fromRGBO(215, 215, 215, 0.6);
  static const Color purple = Color(0xFFAA73F0);
  static const Color purple_20 = Color.fromRGBO(188, 76, 241, 0.2);
  static const Color supportDangerMain = Color(0xFFFF5151);
  static const Color borderShadow = Color.fromRGBO(146, 146, 146, 0.15);
  static const Color shadow = Color.fromRGBO(241, 204, 76, 0.2);
  static const Color popOver = Color.fromRGBO(26, 26, 32, 0.8);
  static const Color tileButtonGray = Color.fromRGBO(51, 51, 63, 0.9);
  static const Color darkDivider = Color.fromRGBO(108, 109, 122, 0.2);

  static const LinearGradient cardLinearGradientHorizontal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Color.fromRGBO(0, 0, 0, 0.2), Color.fromRGBO(0, 0, 0, 0.2)],
  );
  static const LinearGradient cardLinearGradientVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(0, 0, 0, 0), Color.fromRGBO(0, 0, 0, 0.9)],
  );
  static const LinearGradient homeLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(0, 0, 0, 0.37)],
  );

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
