import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

class LoomiVerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final double radius;
  const LoomiVerticalIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorTokens.white,
            ),
            SpacingTokens.v6,
            Text(
              text,
              style: LoomiTextStyle.overline.style.copyWith(
                letterSpacing: LetterSpacingTokens.giga,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
