import 'package:ceyehat_app/core/database/database.dart';
import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_local_data_source.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_remote_data_source.dart';
import 'package:ceyehat_app/infrastructure/repositories/auth_repository_impl.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${Database.tokenBox.values.firstOrNull?.accessToken}';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final authRepository =
          AuthRepositoryImpl(AuthRemoteDataSource(NetworkManager.instance), AuthLocalDataSource(Database.tokenBox, Database.userBox));

      final result = await authRepository.refreshToken();
      result.fold((l) {
        authRepository.logout();
        // Routes.rootNavigatorKey.currentContext?.goNamed(Routes.login);
        handler.next(err);
      }, (r) async {
        final networkManager = NetworkManager.instance;
        final cloneReq = await networkManager.request(err.requestOptions.path,
            options: Options(method: err.requestOptions.method, headers: networkManager.options.headers),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters);

        handler.resolve(cloneReq);
      });
      return;
    }
    super.onError(err, handler);
  }
}
