import 'package:dio/dio.dart';

import '../constants.dart';
import '../get_storage.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = Constants.baseUrl;
  dio.options.connectTimeout = 20000;

  dio.options.headers.addAll({
    'authorization': 'Bearer ${GetStorageHelper.token()}',
    "Accept":"application/json"
  });
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestBody: true,
      requestHeader: true,
    ),
  );
  return dio;
}
