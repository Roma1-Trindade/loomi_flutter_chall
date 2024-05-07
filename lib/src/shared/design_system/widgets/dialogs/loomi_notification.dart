import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';

const Duration _snackbarDisplayDuration = Duration(milliseconds: 5000);

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
        duration: _snackbarDisplayDuration,
        padding: const EdgeInsets.all(SpacingTokens.s12),
        content: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(title),
                    ),
                    InkWell(
                      onTap: () => scaffoldMessengerStateKey.currentState
                          ?.clearSnackBars(),
                      child: const Icon(
                        Icons.close,
                        color: ColorTokens.gray,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(message),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
