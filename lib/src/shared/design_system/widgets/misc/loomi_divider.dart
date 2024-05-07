import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

class LoomiDivider extends StatelessWidget {
  final String title;
  const LoomiDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: ColorTokens.white_20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.s32),
          child: Text(
            title,
            style: LoomiTextStyle.caption.style
                .copyWith(color: ColorTokens.darkGray),
          ),
        ),
        const Expanded(
          child: Divider(
            color: ColorTokens.white_20,
          ),
        )
      ],
    );
  }
}
