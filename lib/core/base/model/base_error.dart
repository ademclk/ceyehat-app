import 'package:ceyehat_app/core/enum/error_type.dart';
import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BaseError<T> {
  final ErrorType type;
  final String message;
  final T? data;

  BaseError(this.type, this.message, [this.data]);

  @override
  String toString() => message;

  String toLocalizedString(BuildContext context) => context.localization.somethingWentWrong;
}
