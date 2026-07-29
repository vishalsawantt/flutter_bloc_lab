import 'package:dio/dio.dart';
import 'package:flutter_bloc_lab/core/rest/ApiConstants/api_constants.dart';
import 'package:flutter_bloc_lab/core/rest/BaseApiService/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  late Dio _dio;

  final String dummyToken = "vishal";

  NetworkApiServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (dummyToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $dummyToken';
          }

          handler.next(options);
        },
      ),
    );
  }

  @override
  Future<dynamic> getApi(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      rethrow;
    }
  }
}