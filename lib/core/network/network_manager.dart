import 'package:ceyehat_app/core/network/interceptors/log_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:flutter/foundation.dart';

class NetworkManager with DioMixin implements Dio {
  static NetworkManager? _instance;
  static NetworkManager get instance =>
      _instance ?? (_instance = NetworkManager._init());

  NetworkManager._init() {
    options = BaseOptions(baseUrl: 'https://localhost:7233/api/');
    if (!kIsWeb) {
      httpClientAdapter = DefaultHttpClientAdapter()
        ..onHttpClientCreate = (client) =>
            client..badCertificateCallback = (cert, host, port) => true;
    }
    interceptors.add(LogInterceptor());
  }
}
