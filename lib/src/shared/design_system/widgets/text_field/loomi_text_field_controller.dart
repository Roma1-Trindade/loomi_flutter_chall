import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';

import 'package:rxdart/rxdart.dart';

class LoomiTextFieldController extends TextEditingController {
  List<String? Function(String)> validators;
  void Function(String)? onChanged;
  late BehaviorSubject<LoomiTextFieldControllerState> _subject;
  bool get dirty => _subject.value.dirty;
  bool get touched => _subject.value.touched;
  List<String> get errorMessages => _subject.value.errorMessages;
  Stream<LoomiTextFieldControllerState> get stream =>
      _subject.stream.shareReplay(maxSize: 1);
  LoomiTextFieldController(
    String? value, {
    bool dirty = false,
    bool touched = false,
    bool shouldShowValidationState = false,
    List<String> errorMessages = const [GENERIC_MANDATORY_FIELD_MSG],
    this.validators = const [],
    String? equalsTo,
    this.onChanged,
  }) : super(text: value) {
    final initialState = LoomiTextFieldControllerState(
      dirty: dirty,
      touched: touched,
      shouldShowValidationState: shouldShowValidationState,
      errorMessages: errorMessages,
    );
    if (equalsTo != null) {
      validators = [
        ...Validators.password,
        ...Validators.genIsEqual(equalsTo),
      ];
    }
    _subject = BehaviorSubject.seeded(initialState);
  }

  bool get isValid => dirty && errorMessages.isEmpty == true;
  String? get errorMessage => (isValid) ? null : errorMessages.first;
  set newErrorMessage(String value) => errorMessage;
  bool get shouldShowValidationState =>
      _subject.value.shouldShowValidationState;
  markAsTouched() {
    _subject.add(_subject.value.copyWith(touched: true));
  }

  markAsUntouched() {
    _subject.add(_subject.value.copyWith(touched: false));
  }

  markAsDirty() {
    _subject.add(_subject.value.copyWith(dirty: true));
  }

  markAsPristine() {
    _subject.add(_subject.value.copyWith(dirty: false));
  }

  showValidationState() {
    _subject.add(_subject.value.copyWith(shouldShowValidationState: true));
  }

  hideValidationState() {
    _subject.add(_subject.value.copyWith(shouldShowValidationState: false));
  }

  markAsObscuredText() {
    _subject.add(_subject.value.copyWith(obscured: true));
  }

  markAsNotObscuredText() {
    _subject.add(_subject.value.copyWith(obscured: false));
  }

  updateValueToCompareWith(String value) {
    _subject.add(_subject.value.copyWith(compareWith: value));
  }

  updateValidators(List<String? Function(String)> newValidators) {
    validators = newValidators;
  }

  internalOnChanged(String value) {
    final errorMessages = validate(value);
    _subject.add(
      _subject.value.copyWith(
        dirty: true,
        touched: true,
        errorMessages: errorMessages,
      ),
    );
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  List<String> validate(String value) {
    final List<String> errorMsgs = [];
    for (var v in validators) {
      final errorMessage = v(value);
      if (errorMessage is String) {
        errorMsgs.add(errorMessage);
      }
    }
    if (_subject.value.compareWith != '') {
      for (Function validator in Validators.passwordIsEqual) {
        String? error = validator(value, _subject.value.compareWith);
        if (error != null) {
          errorMsgs.add(error);
        }
      }
    }
    return errorMsgs;
  }
}

@immutable
class LoomiTextFieldControllerState {
  final bool dirty;
  final bool touched;
  final bool shouldShowValidationState;
  final List<String> errorMessages;
  final bool obscured;
  final String compareWith;

  bool get isValid => dirty && errorMessages.isEmpty == true;
  String? get errorMessage {
    if (isValid) {
      return null;
    } else if (errorMessages.isNotEmpty) {
      return errorMessages.first;
    }
    return null;
  }

  const LoomiTextFieldControllerState({
    this.dirty = false,
    this.touched = false,
    this.shouldShowValidationState = false,
    this.errorMessages = const [],
    this.obscured = true,
    this.compareWith = '',
  });
  LoomiTextFieldControllerState copyWith({
    bool? dirty,
    bool? touched,
    bool? shouldShowValidationState,
    List<String>? errorMessages,
    bool? obscured,
    String? compareWith,
  }) {
    return LoomiTextFieldControllerState(
      dirty: dirty ?? this.dirty,
      touched: touched ?? this.touched,
      shouldShowValidationState:
          shouldShowValidationState ?? this.shouldShowValidationState,
      errorMessages: errorMessages ?? this.errorMessages,
      obscured: obscured ?? this.obscured,
      compareWith: compareWith ?? this.compareWith,
    );
  }

  @override
  String toString() {
    return '''{ dirty: $dirty, touched: $touched, shouldShowValidationState: $shouldShowValidationState, errorMessages: $errorMessages, obscured: $obscured, compareWith: $compareWith }''';
  }
}
