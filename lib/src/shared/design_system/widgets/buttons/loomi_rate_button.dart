import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_icons.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_vertical_icon_button.dart';
import 'package:popover/popover.dart';

class LoomiRateButton extends StatelessWidget {
  final VoidCallback onDislikePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onLoveItPressed;
  const LoomiRateButton({
    super.key,
    required this.onDislikePressed,
    required this.onLikePressed,
    required this.onLoveItPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        showPopover(
          direction: PopoverDirection.bottom,
          backgroundColor: Colors.transparent,
          width: 290,
          height: 70,
          context: context,
          bodyBuilder: (context) => Container(
            decoration: BoxDecoration(
                color: ColorTokens.popOver,
                borderRadius: BorderRadius.circular(60)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoomiVerticalIconButton(
                    icon: LoomiIcons.dislike,
                    text: "It's not for me",
                    onPressed: onDislikePressed,
                    radius: 25,
                  ),
                  LoomiVerticalIconButton(
                    icon: LoomiIcons.thumb_up,
                    text: 'I Like it',
                    onPressed: onLikePressed,
                  ),
                  LoomiVerticalIconButton(
                    icon: LoomiIcons.double_like,
                    text: 'I love it!',
                    onPressed: onLoveItPressed,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      LoomiIcons.outline_close,
                      color: ColorTokens.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LoomiIcons.thumb_up,
              color: ColorTokens.white,
            ),
            SpacingTokens.v6,
            Text(
              'Rate',
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
