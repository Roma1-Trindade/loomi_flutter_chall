import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_icons.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';

class LoomiShareButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoomiShareButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LoomiIcons.send,
              color: ColorTokens.white,
            ),
            SpacingTokens.v6,
            Text(
              'Gift to someone?',
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
