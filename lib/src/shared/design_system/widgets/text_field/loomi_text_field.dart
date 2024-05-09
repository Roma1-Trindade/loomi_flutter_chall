// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_field_color.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

import 'package:rxdart/rxdart.dart';

enum SUFFIX { None, Eye, Close, Copy }

class LoomiTextField extends StatefulWidget {
  final String hintText;
  final LoomiTextFieldController? controller;
  final List<TextInputFormatter> formatters;
  final TextInputType keyboardType;
  final void Function(String)? onSubmitted;
  final String? errorMessage;
  final bool autofocus;
  final FocusNode? focusNode;
  final Widget? prefix;
  final SUFFIX? suffix;
  final String? prefixText;
  final LoomiTextFieldColor color;
  final Function(String)? onChanged;
  final bool? enabled;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final bool showCursor;
  final bool hasDecoration;
  const LoomiTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.formatters = const <TextInputFormatter>[],
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    this.errorMessage,
    this.autofocus = true,
    this.focusNode,
    this.prefix,
    this.suffix = SUFFIX.None,
    this.prefixText,
    this.onChanged,
    this.enabled = true,
    this.color = LoomiTextFieldColor.regular,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.showCursor = true,
    this.hasDecoration = true,
  });
  @override
  _LoomiTextFieldState createState() => _LoomiTextFieldState();
}

class _LoomiTextFieldState extends State<LoomiTextField> {
  late BehaviorSubject<bool> focusSubject;
  late FocusNode focusNode;
  late void Function() focusListener;
  late LoomiTextFieldController controller;

  @override
  void initState() {
    if (widget.controller == null) {
      controller = LoomiTextFieldController(null);
    } else {
      controller = widget.controller!;
    }
    focusSubject = BehaviorSubject.seeded(false);
    focusNode = widget.focusNode ?? FocusNode();
    focusListener = () {
      focusSubject.add(focusNode.hasFocus);
    };
    focusNode.addListener(focusListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<_TextFieldState>(
      initialData: _TextFieldState(
        const LoomiTextFieldControllerState(),
        widget.autofocus,
      ),
      stream: Rx.combineLatest2<LoomiTextFieldControllerState, bool,
          _TextFieldState>(
        controller.stream,
        focusSubject.stream,
        (state, hasFocus) => _TextFieldState(state, hasFocus),
      ),
      builder: (context, snapshot) {
        final data = snapshot.data;
        final state = data?.state;
        final bool shouldShowSuccess = (state?.isValid == true) &&
            (state?.shouldShowValidationState == true);
        final bool shouldShowError = (state?.isValid == false) &&
            (state?.shouldShowValidationState == true);
        final Color sufixPrefixSuccessColor = (state?.isValid == true) &&
                (state?.shouldShowValidationState == true)
            ? widget.color.successBorder
            : widget.color.border;
        final Color sufixPrefixErrorColor = (state?.isValid == false) &&
                (state?.shouldShowValidationState == true)
            ? widget.color.errorBorder
            : widget.color.border;
        Widget? prefix;
        Widget? suffix;
        if (widget.prefix != null) {
          prefix = widget.prefix!;
        } else if (widget.prefixText != null) {
          prefix = _Prefix(
            widget.prefixText!,
            widget.color.prefix,
          );
        }
        if (widget.suffix == SUFFIX.Eye) {
          if (!(state?.obscured ?? false)) {
            suffix = IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: shouldShowSuccess
                    ? sufixPrefixSuccessColor
                    : shouldShowError
                        ? sufixPrefixErrorColor
                        : widget.color.focusedBorder,
              ),
              onPressed: () => controller.markAsObscuredText(),
            );
          } else {
            suffix = IconButton(
              icon: Icon(
                Icons.visibility_off,
                color: shouldShowSuccess
                    ? sufixPrefixSuccessColor
                    : shouldShowError
                        ? sufixPrefixErrorColor
                        : widget.color.focusedBorder,
              ),
              onPressed: () => controller.markAsNotObscuredText(),
            );
          }
        }
        if (widget.suffix == SUFFIX.Close) {
          suffix = IconButton(
            icon: Icon(
              Icons.close,
              color: widget.color.prefix,
            ),
            onPressed: () => controller.text = '',
          );
        }
        if (widget.suffix == SUFFIX.Copy) {
          suffix = IconButton(
            icon: Icon(
              Icons.copy,
              color: widget.color.prefix,
            ),
            onPressed: () => debugPrint('apertou'),
          );
        }
        return Theme(
          data: generateTheme(context, state),
          child: TextField(
            showCursor: widget.showCursor,
            onTap: () {
              controller.markAsTouched();
            },
            onChanged: (String value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
              controller.internalOnChanged(value);
            },
            enabled: widget.enabled,
            textCapitalization: widget.textCapitalization,
            onSubmitted: widget.onSubmitted,
            maxLines: widget.maxLines,
            minLines: 1,
            autofocus: widget.autofocus == true,
            focusNode: focusNode,
            inputFormatters: widget.formatters,
            keyboardType: widget.keyboardType,
            controller: controller,
            obscureText: widget.suffix == SUFFIX.Eye
                ? (state?.obscured ?? false)
                : false,
            decoration: widget.hasDecoration
                ? InputDecoration(
                    hintText: widget.hintText,
                    errorText: state?.shouldShowValidationState == true
                        ? state?.errorMessage
                        : null,
                    prefixIcon: prefix,
                    suffixIcon: suffix,
                  )
                : null,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorTokens.white,
                ),
          ),
        );
      },
    );
  }

  ThemeData generateTheme(
    BuildContext context,
    LoomiTextFieldControllerState? state,
  ) {
    final currentTheme = Theme.of(context);
    final shouldShowSuccess =
        state != null && state.shouldShowValidationState && state.isValid;
    return currentTheme.copyWith(
      inputDecorationTheme: currentTheme.inputDecorationTheme.copyWith(
        prefixStyle: LoomiTextStyle.bodyText1.style.copyWith(
          color: widget.color.prefix,
        ),
        filled: true,
        fillColor: ColorTokens.inputBackground,
        hintStyle: TextStyle(color: widget.color.hintText),
        contentPadding: const EdgeInsets.symmetric(
          vertical: SpacingTokens.s16,
          horizontal: SpacingTokens.s14,
        ),
        errorStyle: LoomiTextStyle.caption.style.copyWith(
          color: widget.color.errorText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: shouldShowSuccess
                ? widget.color.successBorder
                : widget.color.border,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: shouldShowSuccess
                ? widget.color.successBorder
                : widget.color.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: shouldShowSuccess
                ? widget.color.successBorder
                : widget.color.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: shouldShowSuccess
                ? widget.color.successBorder
                : widget.color.focusedBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: widget.color.errorBorder,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            width: 2,
            color: widget.color.errorBorder,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.removeListener(focusListener);
    super.dispose();
  }
}

class _TextFieldState {
  final bool hasFocus;
  final LoomiTextFieldControllerState state;
  _TextFieldState(this.state, this.hasFocus);
}

class _Prefix extends StatelessWidget {
  final String text;
  final Color textColor;
  const _Prefix(this.text, this.textColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size.zero),
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: SpacingTokens.s12),
      child: Text(
        text,
        style: LoomiTextStyle.bodyText2.style.apply(color: textColor),
      ),
    );
  }
}
