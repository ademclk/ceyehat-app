import 'package:ceyehat_app/core/providers/settings_provider.dart';
import 'package:ceyehat_app/main.dart';
import 'package:ceyehat_app/presentation/screens/auth/view/welcome_view.dart';
import 'package:ceyehat_app/presentation/screens/navigation/view/navigation_view.dart';
import 'package:ceyehat_app/presentation/themes/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = ChangeNotifierProvider((ref) => SettingsProvider());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final settings = ref.watch(settingsProvider);
      return MaterialApp(
        theme: DefaultTheme.light,
        darkTheme: DefaultTheme.dark,
        themeMode: settings.themeMode,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: settings.language.locale,
        home: const WelcomeView(),
      );
    });
  }
}
