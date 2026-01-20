import 'api_error_model.dart';

sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  T data;
  ApiSuccessResult({required this.data});
}

class ApiErrorResult<T> extends ApiResult<T> {
  ApiErrorModel apiErrorModel;
  ApiErrorResult({required this.apiErrorModel});
}