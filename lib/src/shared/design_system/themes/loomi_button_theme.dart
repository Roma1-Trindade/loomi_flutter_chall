import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

const double _BTN_HEIGHT = SpacingTokens.s64 - SpacingTokens.s8;

class LoomiButtonTheme {
  static ElevatedButtonThemeData data = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(0, _BTN_HEIGHT),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.s16,
        vertical: SpacingTokens.s12,
      ),
    ),
  );
}
