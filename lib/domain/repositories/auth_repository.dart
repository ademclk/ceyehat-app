import 'package:ceyehat_app/core/base/model/base_error.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<BaseError<Token>, Token>> login(String email, String password);
  Future<Either<BaseError<Token>, Token>> refreshToken();
  Either<BaseError<Token>, Token> getToken();
  Future<void> logout();
}
