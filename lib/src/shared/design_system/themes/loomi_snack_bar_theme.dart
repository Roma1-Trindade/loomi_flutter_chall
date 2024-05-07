import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

class LoomiSnackBarTheme {
  static final SnackBarThemeData data = SnackBarThemeData(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SpacingTokens.s4)),
    ),
    backgroundColor: ColorTokens.gray,
    contentTextStyle: LoomiTextStyle.bodyText1.style.copyWith(
      fontWeight: FontWeightTokens.light,
    ),
    behavior: SnackBarBehavior.floating,
    insetPadding: const EdgeInsets.only(
      bottom: SpacingTokens.s64,
      left: SpacingTokens.s32,
      right: SpacingTokens.s32,
    ),
  );
}
