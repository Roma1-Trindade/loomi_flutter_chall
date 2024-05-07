import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

class LoomiCircularProgressIndicator extends StatelessWidget {
  final double? size;
  final Alignment? alignment;
  final Color? color;
  final double? strokeWidth;

  const LoomiCircularProgressIndicator({
    super.key,
    this.alignment,
    this.size,
    this.color,
    this.strokeWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: alignment ?? Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? SpacingTokens.s4,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? ColorTokens.purple,
        ),
      ),
    );
  }
}
