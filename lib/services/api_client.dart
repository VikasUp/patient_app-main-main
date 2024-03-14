import 'package:dio/dio.dart';
import 'package:patient_app/interceptor_handler/exception_handler.dart';

class ApiClient {
  final Dio _dio;
  static const String baseUrl = 'https://patient.skyviewads.com';
  ApiClient() : _dio = Dio(_getBaseOptions()) {
    _dio.interceptors.add(_getInterceptor());
  }
  static BaseOptions _getBaseOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: Duration(microseconds: 5000),
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 5000),
    );
  }

 
  Interceptor _getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) { 
        options.headers['Authorization'] = 'Bearer YourAccessToken';
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      // ignore: deprecated_member_use
      onError: (DioError error, ErrorInterceptorHandler handler) {
        
        // ignore: deprecated_member_use
        if (error is DioError) {
          final exceptionHandler = ExceptionHandler();
          final handledError = exceptionHandler.handleDioError(error);
          throw handledError;
        } else {
          throw Exception('An unexpected error occurred');
        }
      },
    );
  }

  Future<Response> fetchData() async {
    try {
      final response = await _dio.get('/data');
      return response;
    } catch (error) {
      throw error;
    }
  }
}
