import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_button_color.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/icon_affinity.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/extensions/build_context_extensions.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_circular_progress_indicator.dart';

const double _BTN_HEIGHT = SpacingTokens.s42;

class LoomiButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;
  final LoomiButtonColor _color;
  final Widget? icon;
  final Color? textColor;
  final TextStyle? textStyle;
  final IconAffinity iconAffinity;
  final EdgeInsets? padding;
  final bool hasBorder;
  final bool hasShadow;
  final double width;

  const LoomiButton._(
      {Key? key,
      required LoomiButtonColor color,
      this.text,
      this.onPressed,
      this.icon,
      this.textColor,
      this.isLoading = false,
      this.padding,
      this.textStyle,
      required this.iconAffinity,
      this.hasBorder = true,
      this.hasShadow = true,
      this.width = 200})
      : _color = color,
        super(key: key);

  factory LoomiButton.primary({
    Key? key,
    String? text,
    void Function()? onPressed,
    bool isLoading = false,
    Widget? icon,
    IconAffinity iconAffinity = IconAffinity.trailing,
    Color? textColor,
    EdgeInsets? padding,
    TextStyle? textStyle,
    bool hasBorder = true,
    bool hasShadow = true,
    double width = 200,
  }) =>
      LoomiButton._(
        key: key,
        color: LoomiButtonColor.primary,
        text: text,
        onPressed: onPressed,
        isLoading: isLoading,
        icon: icon,
        textColor: textColor,
        iconAffinity: iconAffinity,
        padding: padding,
        textStyle: textStyle,
        hasBorder: hasBorder,
        hasShadow: hasShadow,
        width: width,
      );

  factory LoomiButton.secondary({
    Key? key,
    String? text,
    void Function()? onPressed,
    bool isLoading = false,
    Widget? icon,
    IconAffinity iconAffinity = IconAffinity.trailing,
    Color? textColor,
    EdgeInsets? padding,
    TextStyle? textStyle,
  }) =>
      LoomiButton._(
        key: key,
        color: LoomiButtonColor.secondary,
        text: text,
        onPressed: onPressed,
        isLoading: isLoading,
        icon: icon,
        textColor: textColor,
        iconAffinity: iconAffinity,
        padding: padding,
        textStyle: textStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _BTN_HEIGHT,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(
                color: ColorTokens.purple,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        style: context.elevatedButtonTheme.style?.copyWith(
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
              (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          shadowColor: MaterialStateProperty.resolveWith<Color>(
              (states) => ColorTokens.shadow),
          padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) {
            return padding != null ? padding! : const EdgeInsets.all(0);
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return _color.disabledBackground;
              } else {
                return _color.base;
              }
            },
          ),
          minimumSize: MaterialStateProperty.all(
            Size(width, _BTN_HEIGHT),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return _color.focusedBackground;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return _color.disabledForeground;
              } else {
                return _color.foreground;
              }
            },
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconAffinity == IconAffinity.leading)
              isLoading
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(right: SpacingTokens.s12),
                      child: icon,
                    ),
            isLoading
                ? const LoomiCircularProgressIndicator(
                    size: SpacingTokens.s24,
                    strokeWidth: SpacingTokens.s4 * 0.75,
                    color: ColorTokens.purple,
                  )
                : Flexible(
                    child: Text(
                      text ?? '',
                      style: textStyle ??
                          LoomiTextStyle.button.style.copyWith(
                            color: textColor != null
                                ? textColor!
                                : isLoading
                                    ? _color.disabledForeground
                                    : onPressed == null
                                        ? _color.disabledForeground
                                        : _color.foreground,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            if (iconAffinity == IconAffinity.trailing)
              isLoading
                  ? const SizedBox()
                  : icon != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: SpacingTokens.s12),
                          child: icon,
                        )
                      : const SizedBox()
          ],
        ),
      ),
    );
  }
}
