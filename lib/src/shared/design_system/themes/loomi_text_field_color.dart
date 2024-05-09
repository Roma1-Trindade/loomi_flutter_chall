import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';

@immutable
class LoomiTextFieldColor {
  final Color placeholder;
  final Color text;
  final Color prefix;
  final Color hintText;
  final Color focusedText;
  final Color errorText;
  final Color border;
  final Color focusedBorder;
  final Color unfocusedText;
  final Color successBorder;
  final Color errorBorder;
  static const regular = LoomiTextFieldColor(
    placeholder: ColorTokens.lightGray,
    text: ColorTokens.white,
    prefix: ColorTokens.white_45,
    hintText: ColorTokens.white_45,
    focusedText: ColorTokens.white,
    unfocusedText: ColorTokens.white,
    errorText: ColorTokens.supportDangerMain,
    errorBorder: ColorTokens.supportDangerMain,
    border: ColorTokens.lightGray,
    focusedBorder: ColorTokens.lightGray,
    successBorder: ColorTokens.lightGray,
  );

  const LoomiTextFieldColor({
    this.placeholder = ColorTokens.white,
    this.text = ColorTokens.white,
    this.prefix = ColorTokens.white,
    this.hintText = ColorTokens.white,
    this.focusedText = ColorTokens.white,
    this.unfocusedText = ColorTokens.white,
    this.errorText = ColorTokens.supportDangerMain,
    this.border = ColorTokens.white,
    this.focusedBorder = ColorTokens.white,
    this.successBorder = ColorTokens.white,
    this.errorBorder = ColorTokens.supportDangerMain,
  });
}
