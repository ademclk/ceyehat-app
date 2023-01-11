import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:ceyehat_app/domain/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _tokenBoxName = 'tokens';
const _userBoxName = 'users';
const _settingBoxName = 'settings';

class Database {
  static Box<Token> get tokenBox => Hive.box<Token>(_tokenBoxName);
  static Box<User> get userBox => Hive.box<User>(_userBoxName);
  static Box<dynamic> get settings => Hive.box<dynamic>(_settingBoxName);

  static Future<void> init() => Future.wait([
        Hive.openBox<Token>(_tokenBoxName),
        Hive.openBox<User>(_userBoxName),
        Hive.openBox<dynamic>(_settingBoxName),
      ]);

  static void clear() {
    tokenBox.clear();
    userBox.clear();
    settings.clear();
  }
}
