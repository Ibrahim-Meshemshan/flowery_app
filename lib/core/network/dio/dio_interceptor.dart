import 'dart:async';
import 'package:dio/dio.dart';
import '../api_constant.dart';

class DioInterceptor extends Interceptor {
  final Future<String?> Function() getAccessToken;
  final Future<String?> Function() getRefreshToken;
  final Future<void> Function(String) saveAccessToken;
  final Future<void> Function(String) saveRefreshToken;
  final Future<Response<dynamic>> Function(String, Map<String, dynamic>) refreshTokenCall;

  DioInterceptor({
    required this.getAccessToken,
    required this.getRefreshToken,
    required this.saveAccessToken,
    required this.saveRefreshToken,
    required this.refreshTokenCall,
  });

  Completer<String?>? _refreshCompleter;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {

    if (_shouldRefreshToken(err)) {
      try {
        final newToken = await _handleTokenRefresh();

        if (newToken != null) {
          final response = await _retryRequest(err.requestOptions, newToken);
          return handler.resolve(response);
        }
      } catch (_) {}
    }

    return handler.next(err);
  }

  bool _shouldRefreshToken(DioException err) {
    return err.response?.statusCode == 401;
  }

  Future<String?> _handleTokenRefresh() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String?>();

    try {
      final refresh = await getRefreshToken();
      if (refresh == null || refresh.isEmpty) {
        _refreshCompleter!.complete(null);
        _refreshCompleter = null;
        return null;
      }

      final res = await refreshTokenCall(
        ApiConstants.refreshToken,
        {'refresh_token': refresh},
      );

      if (res.statusCode == 200) {
        final newAccess = res.data['data_source']['access_token'];
        final newRefresh = res.data['data_source']['refresh_token'];

        await saveAccessToken(newAccess);
        await saveRefreshToken(newRefresh);

        _refreshCompleter!.complete(newAccess);
      } else {
        _refreshCompleter!.complete(null);
      }
    } catch (e) {
      _refreshCompleter!.complete(null);
    }

    final result = await _refreshCompleter!.future;
    _refreshCompleter = null;
    return result;
  }

  Future<Response<dynamic>> _retryRequest(
      RequestOptions requestOptions,
      String newToken,
      ) async {
    requestOptions.headers['Authorization'] = 'Bearer $newToken';

    final dio = Dio();

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }
}
