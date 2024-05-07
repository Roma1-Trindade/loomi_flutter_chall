const EMAIL_REGEX =
    r"""^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$""";
const AT_LEAST_ONE_NUMBER_REGEX = r""".*[0-9].*""";
const AT_LEAST_ONE_LETTER_REGEX = r""".*[A-Za-z].*""";
const AT_LEAST_ONE_SPECIAL_CHARACTER_REGEX = r""".*[!@#$%^&+*=].*""";

const String GENERIC_MANDATORY_FIELD_MSG = 'This field is required';
const String SHOULD_BE_GREATER_THAN_ZERO_MSG =
    'Field should be greater than zero';
const String INVALID_EMAIL_MSG = 'Enter a valid email';
const String AT_LEAST_SIX_CHARACTERS_PWD_MSG =
    'Password must have at least 6 characters';
// const String AT_LEAST_ONE_NUMBER_PWD_MSG =
//     'Password must have at least one number';
// const String AT_LEAST_ONE_LETTER_PWD_MSG =
//     'Password must have at least one letter';
// const String AT_LEAST_ONE_SPECIAL_CHARACTER_PWD_MSG =
//     'Password must have at least one special character (!@#\$%^&*)';
const String PASSWORDS_MUST_BE_THE_SAME_MSG = 'Passwords must be the same';

enum PasswordRequirementsEnum {
  atLeastSixCharacters;

  @override
  String toString() {
    return switch (this) {
      atLeastSixCharacters => AT_LEAST_SIX_CHARACTERS_PWD_MSG,
    };
  }
}

class Validators {
  static List<String? Function(String)> required = [
    (String val) => (val.isEmpty) ? GENERIC_MANDATORY_FIELD_MSG : null
  ];

  static List<String? Function(dynamic)> requiredDynamic = [
    (dynamic val) => (val == null)
        ? GENERIC_MANDATORY_FIELD_MSG
        : val is String
            ? val.isEmpty
                ? GENERIC_MANDATORY_FIELD_MSG
                : null
            : null,
  ];

  static List<String? Function(int)> greaterThanZero = [
    (int val) => val <= 0 ? SHOULD_BE_GREATER_THAN_ZERO_MSG : null,
  ];

  static List<String? Function(String)> email = [
    (String val) => (val.isEmpty) ? GENERIC_MANDATORY_FIELD_MSG : null,
    (String value) =>
        !RegExp(EMAIL_REGEX).hasMatch(value) ? 'Enter a valid email' : null,
  ];

  static List<String? Function(String)> password = [
    (String val) => (val.isEmpty) ? GENERIC_MANDATORY_FIELD_MSG : null,
    (String value) => value.isEmpty
        ? PasswordRequirementsEnum.atLeastSixCharacters.toString()
        : value.length < 6
            ? PasswordRequirementsEnum.atLeastSixCharacters.toString()
            : null,
  ];

  static List<String? Function(String, String)> passwordIsEqual = [
    (String val, String valConfirmation) =>
        (val.isEmpty) || (valConfirmation.isEmpty)
            ? GENERIC_MANDATORY_FIELD_MSG
            : null,
    (String val, String valConfirmation) =>
        !(val == valConfirmation) ? 'Passwords must be the same' : null,
  ];

  static List<String? Function(String)> genIsEqual(String value) =>
      passwordIsEqual
          .map<String? Function(String)>((e) => (String val) => e(value, val))
          .toList();
}
