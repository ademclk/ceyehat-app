import 'package:ceyehat_app/core/base/model/base_error.dart';
import 'package:ceyehat_app/core/enum/error_type.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:ceyehat_app/domain/entities/user.dart';
import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDataSource {
  const AuthLocalDataSource(this._tokenBox, this._userBox);

  final Box<Token> _tokenBox;
  final Box<User> _userBox;

  Either<BaseError<Token>, Token> getToken() {
    final token = _tokenBox.values.firstOrNull;
    return token == null ? left(BaseError(ErrorType.notFound, 'Token not found')) : right(token);
  }

  Future<void> changeToken(Token token) async {
    await _tokenBox.clear();
    await _tokenBox.add(token);
  }

  Future<void> addUser(User user) => _userBox.add(user);

  Future<void> deleteUser() => _userBox.clear();

  Future<void> clearAuth() async {
    await _tokenBox.clear();
    await _userBox.clear();
  }
}
