// class ApiErrorHandler {
// todo: this error handler for zad project
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
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_error_model.dart';
// class ApiErrorHandler {
//   static ApiErrorModel handle(dynamic error) {
//     final context = navigatorKey.currentState!.context;
//     if (error is DioException) {
//       switch (error.type) {
//         case DioExceptionType.connectionError:
//         case DioExceptionType.connectionTimeout:
//         case DioExceptionType.sendTimeout:
//         case DioExceptionType.receiveTimeout:
//           return ApiErrorModel(message: ('no_internet_connection').tr(context));
//
//         case DioExceptionType.badResponse:
//           return _handleBadResponse(error, context);
//
//         case DioExceptionType.unknown:
//           if (_isNoInternetError(error.error)) {
//             return ApiErrorModel(message: ('no_internet_connection').tr(context));
//           }
//           return ApiErrorModel(message: ('unexpected_error').tr(context));
//
//         default:
//           return ApiErrorModel(message: ('unexpected_error').tr(context));
//       }
//     } else if (_isNoInternetError(error)) {
//       return ApiErrorModel(message: ('no_internet_connection').tr(context));
//     } else {
//       return ApiErrorModel(message: ('unexpected_error').tr(context));
//     }
//   }
//
//   static bool _isNoInternetError(dynamic error) {
//     return error is SocketException ||
//         error is HttpException ||
//         error is HandshakeException;
//   }
//
//   static ApiErrorModel _handleBadResponse(DioException error, BuildContext context) {
//     final statusCode = error.response?.statusCode;
//     final responseData = error.response?.data;
//
//     if (responseData != null && responseData is Map<String, dynamic>) {
//       return _handleError(responseData, context);
//     }
//
//     switch (statusCode) {
//       case 400:
//         return ApiErrorModel(message: ('badRequest').tr(context));
//       case 401:
//         return ApiErrorModel(message: ('unauthorized').tr(context));
//       case 403:
//         return ApiErrorModel(message: ('forbidden').tr(context));
//       case 404:
//         return ApiErrorModel(message: ('resource_not_found').tr(context));
//       case 500:
//         return ApiErrorModel(message: ('unexpected_error').tr(context));
//       default:
//         return ApiErrorModel(message: ('unexpected_error').tr(context));
//     }
//   }
//
//   static ApiErrorModel _handleError(dynamic data, BuildContext context) {
//     return ApiErrorModel(
//       message: data['message'] ?? ('unexpected_error').tr(context),
//       status: data['status']?.toString(),
//       data: data['data'],
//     );
//   }
// }

/// A general representation of an API error without context.
/// messageKey: can be translated in UI layer.

/// A robust API error handler that does NOT depend on Flutter UI context.
/// It categorizes common error cases from client and server.
class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (_isNoInternetError(error)) {
      return ApiErrorModel(message: 'no_internet_connection');
    }

    if (error is DioException) {
      return _handleDioException(error);
    }

    if (error is FormatException) {
      return ApiErrorModel(message: 'bad_response_format');
    }

    return ApiErrorModel(message: 'unexpected_error');
  }

  static bool _isNoInternetError(dynamic error) {
    return error is SocketException ||
        error is HttpException ||
        error is HandshakeException;
  }

  static ApiErrorModel _handleDioException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;

    if (response == null || statusCode == null) {
      return ApiErrorModel(message: 'server_unreachable');
    }

    if (response.data != null && response.data is Map<String, dynamic>) {
      return ApiErrorModel.fromJson(response.data, statusCode: statusCode);
    }

    return ApiErrorModel(
      message: _clientErrorMessage(statusCode),
      statusCode: statusCode,
    );
  }

  static String _clientErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400: return 'bad_request';
      case 401: return 'unauthorized';
      case 403: return 'forbidden';
      case 404: return 'resource_not_found';
      case 422: return 'validation_error';
      case 500: return 'internal_server_error';
      default: return 'something_went_wrong';
    }
  }
}
