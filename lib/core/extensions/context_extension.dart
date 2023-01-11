import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  Future<T?> push<T>(Widget widget) => Navigator.of(this).push<T>(MaterialPageRoute(builder:(context) => widget));
}