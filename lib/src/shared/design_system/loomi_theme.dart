import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_button_theme.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_snack_bar_theme.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

class LoomiTheme {
  static ThemeData data(BuildContext context) => ThemeData(
        primaryColor: ColorTokens.black,
        primaryColorDark: ColorTokens.black,
        colorScheme: ColorTokens.scheme,
        fontFamily: LoomiTypographyTokens.EpilogueFamily,
        snackBarTheme: LoomiSnackBarTheme.data,
        scaffoldBackgroundColor: ColorTokens.black,
        elevatedButtonTheme: LoomiButtonTheme.data,
      );
}
