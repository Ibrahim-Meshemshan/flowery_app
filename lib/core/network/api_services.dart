import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  // Get Method
  Future<Response> get({
    required String url,
    dynamic queryParameters,
    dynamic options,
    dynamic data,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return response;
  }

  // Post Method
  Future<Response> post({
    required String url,
    dynamic data,
    dynamic queryParameters,
    dynamic options,
  }) async {
    final response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  // Put Method
  Future<Response> put({
    required String url,
    dynamic data,
    dynamic queryParameters,
    dynamic options,
  }) async {
    final response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  // Patch Method
  Future<Response> patch({
    required String url,
    dynamic data,
    dynamic queryParameters,
    dynamic options,
  }) async {
    final response = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  // Delete Method
  Future<Response> delete({
    required String url,
    dynamic data,
    dynamic queryParameters,
    dynamic options,
  }) async {
    final response = await _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }
}
