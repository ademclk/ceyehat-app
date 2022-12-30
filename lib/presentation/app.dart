import 'package:ceyehat_app/presentation/screens/navigation/view/navigation_view.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigationView(),
      theme: ThemeData.light(),
    );
  }
}
