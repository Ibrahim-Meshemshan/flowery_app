import 'dart:convert';

ApiErrorModel apiErrorModelFromJson(String str) => ApiErrorModel.fromJson(json.decode(str));

String apiErrorModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  final String messageKey;
  final int? statusCode;
  final dynamic data;

  ApiErrorModel({
    required this.messageKey,
    this.statusCode,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
    statusCode: json["status"],
    data: json["data_source"],
    messageKey: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": statusCode,
    "data_source": data,
    "message": messageKey,
  };
}


