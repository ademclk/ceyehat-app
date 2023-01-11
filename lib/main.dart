import 'package:ceyehat_app/core/database/database.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:ceyehat_app/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initHive();
  runApp(const ProviderScope(child: App()));
}

Future<void> initHive() async {
  await Hive.initFlutter("ceyehat_app");
  Hive.registerAdapter(TokenAdapter());
  await Database.init();
}
