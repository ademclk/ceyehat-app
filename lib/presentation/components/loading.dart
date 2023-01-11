import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      color: backgroundColor ?? theme.colorScheme.surface,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
