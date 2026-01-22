
class ApiErrorModel {
  final String message;
  final int? statusCode;

  ApiErrorModel({
    required this.message,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json, {int? statusCode}) {

    final dynamic errorData = json['error'] ?? json['message'] ?? 'unexpected_error';

    return ApiErrorModel(
      message: _formatErrorMessage(errorData),
      statusCode: statusCode,
    );
  }

  static String _formatErrorMessage(dynamic errorData) {
    if (errorData is List) {
      return errorData.join('\n');
    }
    if (errorData is String) {

      return errorData.replaceAll('","', '\n').replaceAll('"', '');
    }
    return errorData.toString();
  }
}


