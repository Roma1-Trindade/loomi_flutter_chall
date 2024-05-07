import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

LoomiTextFieldController useLoomiTextFieldController({
  String? initialValue,
  bool? dirty,
  bool? touched,
  bool? shouldShowValidationState,
  List<String>? errorMessages,
  List<String? Function(String)> validators = const [],
  String? equalsTo,
  void Function(String)? onChanged,
  List<Object?>? keys,
}) =>
    use(_LoomiTextControllerHook(
      initialValue: initialValue,
      dirty: dirty,
      equalsTo: equalsTo,
      errorMessages: errorMessages,
      onChanged: onChanged,
      shouldShowValidationState: shouldShowValidationState,
      touched: touched,
      validators: validators,
      keys: keys,
    ));

class _LoomiTextControllerHook extends Hook<LoomiTextFieldController> {
  final String? initialValue;
  final bool? dirty;
  final bool? touched;
  final bool? shouldShowValidationState;
  final List<String>? errorMessages;
  final List<String? Function(String)> validators;
  final String? equalsTo;
  final void Function(String)? onChanged;

  const _LoomiTextControllerHook({
    this.initialValue,
    this.dirty,
    this.touched,
    this.shouldShowValidationState,
    this.errorMessages,
    this.equalsTo,
    this.onChanged,
    this.validators = const [],
    List<Object?>? keys,
  }) : super(keys: keys);

  @override
  HookState<LoomiTextFieldController, _LoomiTextControllerHook> createState() =>
      _LoomiTextControllerHookState();
}

class _LoomiTextControllerHookState
    extends HookState<LoomiTextFieldController, _LoomiTextControllerHook> {
  late LoomiTextFieldController controller;

  @override
  void initHook() {
    super.initHook();
    controller = LoomiTextFieldController(
      hook.initialValue,
      dirty: hook.dirty ?? false,
      equalsTo: hook.equalsTo,
      errorMessages: hook.errorMessages ?? [GENERIC_MANDATORY_FIELD_MSG],
      onChanged: hook.onChanged,
      shouldShowValidationState: hook.shouldShowValidationState ?? false,
      touched: hook.touched ?? false,
      validators: hook.validators,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  LoomiTextFieldController build(BuildContext context) {
    return controller;
  }
}
