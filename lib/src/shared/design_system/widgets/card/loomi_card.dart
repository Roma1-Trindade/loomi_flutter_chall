import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_rate_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_share_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/extensions/date_time_extensions.dart';

class LoomiCard extends StatelessWidget {
  final String backgroundImage;
  final String gender;
  final String title;
  final String synopsis;
  final int commentsNumber;
  final VoidCallback onWatchPressed;
  final bool watchButtonIsLoading;
  final DateTime available;
  final VoidCallback onDislikePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onLoveItPressed;
  final VoidCallback onGiftPressed;
  const LoomiCard({
    super.key,
    required this.backgroundImage,
    required this.gender,
    required this.title,
    required this.synopsis,
    required this.commentsNumber,
    required this.onWatchPressed,
    this.watchButtonIsLoading = false,
    required this.available,
    required this.onDislikePressed,
    required this.onLikePressed,
    required this.onLoveItPressed,
    required this.onGiftPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(backgroundImage),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: ColorTokens.cardLinearGradientHorizontal,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorTokens.borderShadow),
                  borderRadius: BorderRadius.circular(22),
                  gradient: ColorTokens.cardLinearGradientVertical,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SpacingTokens.s22,
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SpacingTokens.s18,
                          right: SpacingTokens.s60,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              gender,
                              style: LoomiTextStyle.button.style.copyWith(
                                color: ColorTokens.cardTextColor,
                              ),
                            ),
                            SpacingTokens.v8,
                            Text(
                              title,
                              style: LoomiTextStyle.button.style.copyWith(
                                fontSize: FontSizeTokens.s32,
                                color: ColorTokens.white,
                              ),
                            ),
                            SpacingTokens.v8,
                            Text(synopsis,
                                style: LoomiTextStyle.bodyText2.style.copyWith(
                                  color: ColorTokens.cardTextColor,
                                )),
                            SpacingTokens.v20,
                            Text(
                              'Comments $commentsNumber',
                              style: LoomiTextStyle.bold.style.copyWith(
                                color: ColorTokens.cardTextColor,
                              ),
                            ),
                            SpacingTokens.v4,
                            Text(
                              'Lorem ipsum dolor sit amet, consectasasdasdasdasdasdasda',
                              style: LoomiTextStyle.bodyText1.style.copyWith(
                                color: ColorTokens.cardTextColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SpacingTokens.v36,
                          ],
                        ),
                      ),
                      LoomiButton.primary(
                        text: 'Watch',
                        onPressed: onWatchPressed,
                        isLoading: watchButtonIsLoading,
                      ),
                      SpacingTokens.v20,
                      const Divider(
                        color: ColorTokens.divider,
                      ),
                      SpacingTokens.v20,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SpacingTokens.s18,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                LoomiRateButton(
                                  onDislikePressed: onDislikePressed,
                                  onLikePressed: onLikePressed,
                                  onLoveItPressed: onLoveItPressed,
                                ),
                                SpacingTokens.h26,
                                LoomiShareButton(
                                  onPressed: onGiftPressed,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Available until',
                                      style:
                                          LoomiTextStyle.caption.style.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SpacingTokens.v2,
                                    Text(
                                      available.toyMMMdyyyy,
                                      style: LoomiTextStyle.bold.style.copyWith(
                                        color: ColorTokens.purple,
                                        fontSize: FontSizeTokens.kilo,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
