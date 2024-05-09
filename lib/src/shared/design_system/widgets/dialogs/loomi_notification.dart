import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

const Duration _snackbarDisplayDuration = Duration(seconds: 5);

class LoomiNotification {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerStateKey =
      GlobalKey<ScaffoldMessengerState>();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      showNotification(
    String title,
    String message,
  ) {
    scaffoldMessengerStateKey.currentState?.clearSnackBars();
    return scaffoldMessengerStateKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: ColorTokens.inputBackground,
        duration: _snackbarDisplayDuration,
        elevation: 0,
        padding: const EdgeInsets.all(SpacingTokens.s12),
        content: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    InkWell(
                      onTap: () => scaffoldMessengerStateKey.currentState
                          ?.clearSnackBars(),
                      child: const Icon(
                        Icons.close,
                        color: ColorTokens.white,
                      ),
                    ),
                  ],
                ),
                SpacingTokens.v8,
                Text(
                  message,
                  style: LoomiTextStyle.subtitle1.style,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
