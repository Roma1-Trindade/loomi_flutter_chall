import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';

@immutable
class LoomiButtonColor {
  final Color base;
  final Color foreground;
  final Color focusedBackground;
  final Color focusedForeround;
  final Color disabledBackground;
  final Color disabledForeground;
  const LoomiButtonColor._(
    this.base, {
    required this.foreground,
    required this.focusedBackground,
    required this.focusedForeround,
    required this.disabledBackground,
    required this.disabledForeground,
  });
  static const LoomiButtonColor primary = LoomiButtonColor._(
    ColorTokens.purple_20,
    disabledBackground: ColorTokens.purple_20,
    disabledForeground: ColorTokens.white_33,
    focusedBackground: ColorTokens.purple_20,
    focusedForeround: ColorTokens.purple_20,
    foreground: ColorTokens.purple,
  );

  static const LoomiButtonColor secondary = LoomiButtonColor._(
    ColorTokens.black,
    disabledBackground: ColorTokens.white_33,
    disabledForeground: ColorTokens.white_33,
    focusedBackground: ColorTokens.black,
    focusedForeround: ColorTokens.black,
    foreground: ColorTokens.purple,
  );

  static const LoomiButtonColor tertiary = LoomiButtonColor._(
    ColorTokens.purple_20,
    disabledBackground: ColorTokens.white_33,
    disabledForeground: ColorTokens.white_33,
    focusedBackground: ColorTokens.purple_20,
    focusedForeround: ColorTokens.purple_20,
    foreground: ColorTokens.purple_20,
  );

  static const LoomiButtonColor quaternary = LoomiButtonColor._(
    ColorTokens.purple_20,
    disabledBackground: ColorTokens.white_33,
    disabledForeground: ColorTokens.white_33,
    focusedBackground: ColorTokens.purple_20,
    focusedForeround: ColorTokens.purple_20,
    foreground: ColorTokens.purple_20,
  );

  static const LoomiButtonColor quinary = LoomiButtonColor._(
    ColorTokens.purple_20,
    disabledBackground: ColorTokens.white_33,
    disabledForeground: ColorTokens.white_33,
    focusedBackground: ColorTokens.purple_20,
    focusedForeround: ColorTokens.purple_20,
    foreground: ColorTokens.purple_20,
  );
}
