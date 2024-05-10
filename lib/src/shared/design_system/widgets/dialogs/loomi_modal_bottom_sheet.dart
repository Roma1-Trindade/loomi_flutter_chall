import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

class LoomiModalBottomSheet extends StatelessWidget {
  final double height;
  final String title;
  final List<Widget> children;
  final TextStyle? style;
  const LoomiModalBottomSheet({
    super.key,
    required this.height,
    required this.title,
    required this.children,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingTokens.s26,
          vertical: SpacingTokens.s30,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorTokens.purple,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      title,
                      style: style ??
                          LoomiTextStyle.extraBold.style.copyWith(
                            color: ColorTokens.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
