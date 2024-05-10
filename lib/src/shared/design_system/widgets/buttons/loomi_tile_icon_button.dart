import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

class LoomiTileIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const LoomiTileIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingTokens.s16,
          vertical: SpacingTokens.s20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorTokens.tileButtonGray,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorTokens.white,
              size: 15,
            ),
            SpacingTokens.h8,
            Expanded(
              child: Text(
                text,
                style: LoomiTextStyle.bodyText1.style.copyWith(
                  color: ColorTokens.white,
                ),
              ),
            ),
            SpacingTokens.h8,
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: ColorTokens.white,
            ),
          ],
        ),
      ),
    );
  }
}
