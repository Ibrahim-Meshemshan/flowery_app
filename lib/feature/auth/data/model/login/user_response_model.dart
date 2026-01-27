import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final String message;
  final UserModel user;
  final String token;

  UserResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
