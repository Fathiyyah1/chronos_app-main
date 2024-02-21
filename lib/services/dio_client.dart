import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String baseUrl = "CENSORED";
  static init([String token = "CENSORED"]) {
    dio = Dio(
      BaseOptions(
        sendTimeout: 5 * 1000,
        receiveTimeout: 10 * 1000,
        connectTimeout: 4 * 1000,
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status <= 500;
        },
        receiveDataWhenStatusError: true,
        headers: token != ""
            ? {
                "Authorization": "Token " + token,
              }
            : null,
      ),
    );
  }
}
