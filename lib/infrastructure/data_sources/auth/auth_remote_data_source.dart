import 'package:ceyehat_app/core/enum/error_type.dart';
import 'package:ceyehat_app/core/extensions/response_extension.dart';
import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/domain/entities/token.dart';
import 'package:ceyehat_app/domain/errors/login_error.dart';
import 'package:ceyehat_app/infrastructure/models/token_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

const _loginPath = 'auth/login';
const _refreshTokenPath = 'auth/refresh';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._networkManager);

  final NetworkManager _networkManager;

  Future<Either<LoginError, Token>> login(String email, String password) =>
      _networkManager.post(_loginPath, data: {'email': email, 'password': password}).then((res) => right(TokenModel.fromJson(res.data)),
          onError: (e) =>
              left<LoginError, Token>(LoginError(ErrorType.fromStatusCode((e as DioError).response?.statusCode), e.response.errorMessage)));

  Future<Either<LoginError, Token>> refreshToken(String refreshToken) =>
      _networkManager.get(_refreshTokenPath, queryParameters: {'refreshToken': refreshToken}).then((res) => right(TokenModel.fromJson(res.data)),
          onError: (e) =>
              left<LoginError, Token>(LoginError(ErrorType.fromStatusCode((e as DioError).response?.statusCode), e.response.errorMessage)));
}
