import 'package:ceyehat_app/core/base/model/base_error.dart';
import 'package:ceyehat_app/core/enum/error_type.dart';
import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:flutter/material.dart';

class LoginError extends BaseError<Token> {
  LoginError(super.type, super.message);

  @override
  String toLocalizedString(BuildContext context) {
    final localization = context.localization;
    switch (type) {
      case ErrorType.notFound:
        return localization.wrongEmailOrPassword;
      default:
        return localization.somethingWentWrong;
    }
  }
}
