import 'dart:io';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

// class ApiErrorHandler {
//   static ApiErrorModel handle(dynamic error) {
//     if (_isNoInternetError(error)) {
//       return ApiErrorModel(message: 'S.current.noConnection');
//     }
//
//     if (error is DioException) {
//       switch (error.type) {
//         case DioExceptionType.connectionError:
//         case DioExceptionType.connectionTimeout:
//         case DioExceptionType.sendTimeout:
//         case DioExceptionType.receiveTimeout:
//           return ApiErrorModel(message: 'S.current.noConnection');
//
//         case DioExceptionType.cancel:
//           return ApiErrorModel(message: 'S.current.unexpectedError');
//
//         case DioExceptionType.badResponse:
//           final statusCode = error.response?.statusCode;
//           if (statusCode == 401) {
//             return ApiErrorModel(message: 'S.current.unauthorized');
//           } else if (statusCode == 403) {
//             return ApiErrorModel(message: 'S.current.forbidden');
//           } else if (statusCode == 400) {
//             return ApiErrorModel(message: 'S.current.badRequest');
//           } else if (statusCode == 404) {
//             return ApiErrorModel(message: 'S.current.resourceNotFound');
//           } else if (statusCode! >= 500) {
//             return ApiErrorModel(message: 'S.current.serverError');
//           }
//           return _handleError(error.response?.data);
//
//         case DioExceptionType.badCertificate:
//           return ApiErrorModel(message: 'S.current.unexpectedError');
//
//         case DioExceptionType.unknown:
//           if (_isNoInternetError(error.error)) {
//             return ApiErrorModel(message: 'S.current.noConnection');
//           }
//           return ApiErrorModel(message: 'S.current.unexpectedError');
//       }
//     } else {
//       if (error is FormatException) {
//         return ApiErrorModel(message: 'S.current.badResponseFormat');
//       }
//       return ApiErrorModel(message: 'S.current.unexpectedError');
//     }
//   }
//
//   static bool _isNoInternetError(dynamic error) {
//     return error is SocketException ||
//         (error is DioException && error.error is SocketException);
//   }
//
//   static ApiErrorModel _handleError(dynamic data) { // depend on backend
//     return ApiErrorModel(
//       message: data['message'] ?? 'S.current.unexpectedError',
//       status: data['status'],
//       data: data['data_source'],
//     );
//   }
// }
class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'S.current.noConnection');

        case DioExceptionType.badResponse:
          return _handleBadResponse(error);

        case DioExceptionType.unknown:
          if (_isNoInternetError(error.error)) {
            return ApiErrorModel(message: 'S.current.noConnection');
          }
          return ApiErrorModel(message: 'S.current.unexpectedError');

        default:
          return ApiErrorModel(message: 'S.current.unexpectedError');
      }
    } else if (_isNoInternetError(error)) {
      return ApiErrorModel(message: 'S.current.noConnection');
    } else {
      return ApiErrorModel(message: 'S.current.unexpectedError');
    }
  }

  static bool _isNoInternetError(dynamic error) {
    return error is SocketException ||
        error is HttpException ||
        error is HandshakeException;
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    if (responseData != null && responseData is Map<String, dynamic>) {
      return _handleError(responseData);
    }

    switch (statusCode) {
      case 400:
        return ApiErrorModel(message: 'S.current.badRequest');
      case 401:
        return ApiErrorModel(message: 'S.current.unauthorized');
      case 403:
        return ApiErrorModel(message: 'S.current.forbidden');
      case 404:
        return ApiErrorModel(message: 'S.current.resourceNotFound');
      case 500:
        return ApiErrorModel(message: 'S.current.serverError');
      default:
        return ApiErrorModel(message: 'S.current.unexpectedError');
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    return ApiErrorModel(
      message: data['message'] ?? 'S.current.unexpectedError',
      status: data['status']?.toString(),
      data: data['data'],
    );
  }
}
