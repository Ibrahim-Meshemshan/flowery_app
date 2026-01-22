import 'dart:io';

import '../network/api_error_handler.dart';
import '../network/api_error_model.dart';
import '../network/api_result.dart';
import '../network/network_info.dart';

abstract class BaseRepo {
  final NetworkInfo networkInfo;

  BaseRepo({required this.networkInfo});

  /// Generic method to handle API calls
  Future<ApiResult<T>> callApi<T>(Future<T> Function() apiCall) async {
    if (!await networkInfo.isConnected) {
      return ApiErrorResult(
        apiErrorModel: ApiErrorModel(messageKey: 'no_internet_connection'),
      );
    }

    try {
      final result = await apiCall();
      return ApiSuccessResult(data: result);
    } catch (error) {
      return ApiErrorResult(apiErrorModel: ApiErrorHandler.handle(error));
    }
  }
}
