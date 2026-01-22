import 'package:json_annotation/json_annotation.dart';

import '../login/user_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final String message;
  final UserModel user;
  final String token;

  RegisterResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
