import 'package:ceyehat_app/core/base/model/base_error.dart';
import 'package:ceyehat_app/core/enum/error_type.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:ceyehat_app/domain/repositories/auth_repository.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_local_data_source.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<BaseError<Token>, Token>> login(String email, String password) async {
    final result = await _remoteDataSource.login(email, password);

    return result.map((r) {
      _localDataSource.changeToken(r);
      return r;
    });
  }

  @override
  Future<Either<BaseError<Token>, Token>> refreshToken() async {
    final oldToken = _localDataSource.getToken().fold((l) => null, (r) => r);

    if (oldToken == null) return left(BaseError<Token>(ErrorType.notFound, ''));

    final result = await _remoteDataSource.refreshToken(oldToken.refreshToken);

    return result.map((r) {
      _localDataSource.changeToken(r);
      return r;
    });
  }

  @override
  Either<BaseError<Token>, Token> getToken() => _localDataSource.getToken();

  @override
  Future<void> logout() => _localDataSource.clearAuth();
  
  @override
  Future<Either<BaseError<Token>, Token>> register(String email, String password, String firstName, String lastName) async {
    final result = await _remoteDataSource.register(email, password, firstName, lastName);
    
    return result.map((r) {
      _localDataSource.changeToken(r);
      return r;
    });
  }
}
