import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

class LoomiDialog extends StatelessWidget {
  const LoomiDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SpacingTokens.s16,
          ),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: LoomiTextStyle.headline7.style.copyWith(
            fontWeight: FontWeightTokens.bold,
          ),
        ),
        titlePadding: const EdgeInsets.only(
          left: SpacingTokens.s32,
          right: SpacingTokens.s32,
          top: SpacingTokens.s32,
          bottom: SpacingTokens.s16,
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: LoomiTextStyle.bodyText2.style,
        ),
        contentPadding: const EdgeInsets.only(
          left: SpacingTokens.s32,
          right: SpacingTokens.s32,
          bottom: SpacingTokens.s32,
        ),
        actions: actions,
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: SpacingTokens.s32,
          vertical: SpacingTokens.s16,
        ));
  }
}
