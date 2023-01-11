import 'package:ceyehat_app/core/constants/app_constants.dart';
import 'package:ceyehat_app/core/network/interceptors/log_interceptor.dart';
import 'package:ceyehat_app/core/network/interceptors/token_iterceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:flutter/foundation.dart';

class NetworkManager with DioMixin implements Dio {
  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ?? (_instance = NetworkManager._init());

  NetworkManager._init() {
    options = BaseOptions(baseUrl: baseUrl, headers: baseHeader);
    if (!kIsWeb) {
      httpClientAdapter = DefaultHttpClientAdapter()..onHttpClientCreate = (client) => client..badCertificateCallback = (cert, host, port) => true;
    }
    interceptors.add(LogInterceptor());
    interceptors.add(TokenInterceptor());
  }
}
