import 'package:ceyehat_app/core/extensions/string_extension.dart';

typedef ValidatorFunc = String? Function(String?);

class Validators {
  static int maxEmailLength = 50;
  static int maxPasswordLength = 16;
  static int maxTitleLength = 50;
  static int maxDescriptionLength = 255;
  static int maxPhoneLength = 12;

  static ValidatorFunc email(String error, {String? emptyError, bool canBeEmpty = false}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: canBeEmpty,
        onValidate: () => value!.contains('@') && value.split('@').length >= 2 && value.length <= maxEmailLength,
      );

  static ValidatorFunc password(String error, {String? emptyError}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: false,
        onValidate: () => value!.length >= 6 && value.length <= maxPasswordLength,
      );

  static ValidatorFunc title(String error, {String? emptyError, bool canBeEmpty = false}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: canBeEmpty,
        onValidate: () => value!.length >= 3 && value.length <= maxTitleLength,
      );

  static ValidatorFunc description(String error, {String? emptyError, bool canBeEmpty = false}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: canBeEmpty,
        onValidate: () => value!.length >= 3 && value.length <= maxDescriptionLength,
      );

  static ValidatorFunc phone(String error, {String? emptyError, bool canBeEmpty = false}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: canBeEmpty,
        onValidate: () => value!.length >= 4 && value.length <= maxPhoneLength && value.isNumeric(),
      );

  static ValidatorFunc number(String error, {String? emptyError, bool canBeEmpty = false, int minLength = 0, int maxLength = 50}) =>
      (String? value) => _validate(
            value: value,
            error: error,
            emptyError: emptyError,
            canBeEmpty: canBeEmpty,
            onValidate: () => value?.isNumeric() == true && value!.length >= minLength && value.length <= maxLength,
          );

  static ValidatorFunc url(String error, {String? emptyError, bool canBeEmpty = false}) => (String? value) => _validate(
        value: value,
        error: error,
        emptyError: emptyError,
        canBeEmpty: canBeEmpty,
        onValidate: () => Uri.tryParse(value!)?.isScheme('HTTPS') == true,
      );

  static String? _validate(
      {required String? value, required String? error, required String? emptyError, required bool canBeEmpty, required bool Function() onValidate}) {
    if (value?.isEmpty != false) return canBeEmpty ? null : (emptyError ?? error);

    return onValidate() ? null : error;
  }
}
