import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

@immutable
class LoomiTextStyle {
  final TextStyle style;
  const LoomiTextStyle._(this.style);

  static LoomiTextStyle h1 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.tera,
      fontWeight: FontWeightTokens.bold,
      letterSpacing: LetterSpacingTokens.deka,
    ),
  );
  static LoomiTextStyle extraBold = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.hecto,
      fontWeight: FontWeightTokens.extraBold,
    ),
  );
  static LoomiTextStyle headline1 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.weka,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.deka,
    ),
  );
  static LoomiTextStyle headline2 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.yotta,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.hecto,
    ),
  );
  static LoomiTextStyle headline3 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.zetta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.kilo,
    ),
  );
  static LoomiTextStyle headline4 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.exa,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.tera,
    ),
  );
  static LoomiTextStyle headline5 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.peta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.kilo,
    ),
  );
  static LoomiTextStyle headline6 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.tera,
      fontWeight: FontWeightTokens.bold,
      letterSpacing: LetterSpacingTokens.giga,
      // color: ColorTokens.alabaster,
    ),
  );
  static LoomiTextStyle headline7 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.giga,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.giga,
    ),
  );
  static LoomiTextStyle subtitle1 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.kilo,
      fontWeight: FontWeightTokens.regular,
    ),
  );
  static LoomiTextStyle subtitle2 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.zetta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.mega,
    ),
  );
  static LoomiTextStyle bodyText1 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.mega,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.exa,
    ),
  );
  static LoomiTextStyle bodyText2 = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.kilo,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.tera,
    ),
  );
  static LoomiTextStyle button = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.kilo,
      fontWeight: FontWeightTokens.bold,
      letterSpacing: LetterSpacingTokens.exa,
    ),
  );
  static LoomiTextStyle caption = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.hecto,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.peta,
    ),
  );
  static LoomiTextStyle overline = const LoomiTextStyle._(
    TextStyle(
      fontFamily: LoomiTypographyTokens.EpilogueFamily,
      fontSize: FontSizeTokens.deka,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.yotta,
    ),
  );
  LoomiTextStyle get weightLight =>
      LoomiTextStyle._(style.copyWith(fontWeight: FontWeightTokens.light));
  LoomiTextStyle get weightRegular =>
      LoomiTextStyle._(style.copyWith(fontWeight: FontWeightTokens.regular));
  LoomiTextStyle get weightBold =>
      LoomiTextStyle._(style.copyWith(fontWeight: FontWeightTokens.bold));
}
