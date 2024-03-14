import 'package:dio/dio.dart';

class BaseExceptionHandler implements Exception {
  final String message;
  BaseExceptionHandler(this.message);
  @override
  String toString() => 'ApiException: $message';
}

class ConnectionTimeoutException extends BaseExceptionHandler {
  ConnectionTimeoutException(String message) : super(message);
}

class BadRequestException extends BaseExceptionHandler {
  BadRequestException(String message) : super(message);
}

class UnauthorizedException extends BaseExceptionHandler {
  UnauthorizedException(String message) : super(message);
}

class NotFoundException extends BaseExceptionHandler {
  NotFoundException(String message) : super(message);
}

class ServerErrorException extends BaseExceptionHandler {
  ServerErrorException(String message) : super(message);
}

class ExceptionHandler {
  // ignore: deprecated_member_use
  BaseExceptionHandler handleDioError(DioError error) {
    switch (error.type) {
      // ignore: deprecated_member_use
      case DioErrorType.connectionTimeout:
        return ConnectionTimeoutException('Connection timed out');
      // ignore: deprecated_member_use
      case DioErrorType.receiveTimeout:
        return BaseExceptionHandler('Receive timeout');
      // ignore: deprecated_member_use
      case DioErrorType.sendTimeout:
        return BaseExceptionHandler('Send timeout');
      // ignore: deprecated_member_use
      case DioErrorType.badResponse:
        return handleResponseError(error);
      // ignore: deprecated_member_use
      case DioErrorType.cancel:
        return BaseExceptionHandler('Request was cancelled');
      // ignore: deprecated_member_use
      case DioErrorType.unknown:
        return BaseExceptionHandler('An unexpected error occurred');
      default:
        return BaseExceptionHandler('An unexpected error occurred');
    }
  }

  // ignore: deprecated_member_use
  BaseExceptionHandler handleResponseError(DioError error) {
    if (error.response?.statusCode == 200) {
      return BaseExceptionHandler('OK: ${error.response?.statusCode}');
    } else if (error.response?.statusCode == 400) {
      return BadRequestException('Bad Request: ${error.response?.statusCode}');
    } else if (error.response?.statusCode == 401) {
      return UnauthorizedException('Unauthorized: ${error.response?.statusCode}');
    } else if (error.response?.statusCode == 404) {
      return NotFoundException('Not Found: ${error.response?.statusCode}');
    } else if (error.response?.statusCode == 500) {
      return ServerErrorException('Internal Server Error: ${error.response?.statusCode}');
    } else {
      return BaseExceptionHandler('An unexpected response error occurred');
    }
  }
}
