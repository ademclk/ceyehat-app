import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

enum Languages {
  system(null),
  english('en'),
  turkish('tr');

  const Languages(this.code);

  final String? code;

  Locale? get locale => code == null ? null : Locale(code!);

  String toLocalizedString(BuildContext context) {
    final localization = context.localization;

    switch (this) {
      case Languages.english:
        return localization.english;
      case Languages.turkish:
        return localization.turkish;
      default:
        return localization.system;
    }
  }
}
