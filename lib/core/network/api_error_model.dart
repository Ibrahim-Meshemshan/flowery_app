import 'dart:convert';

ApiErrorModel apiErrorModelFromJson(String str) => ApiErrorModel.fromJson(json.decode(str));

String apiErrorModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  String? status;
  dynamic data;
  String? message;

  ApiErrorModel({
     this.status,
     this.data,
     this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
    status: json["status"],
    data: json["data_source"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data_source": data,
    "message": message,
  };
}


