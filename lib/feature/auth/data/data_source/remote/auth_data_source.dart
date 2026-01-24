import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';

import '../../model/forget_password/otp_response_model.dart';
import '../../model/login/user_response_model.dart';
import '../../model/register/register_response_model.dart';

abstract class AuthDataSource {
  Future<UserResponseModel> login(LoginRequest login);
  Future<RegisterResponseModel> register(RegisterRequest register);
  Future<OtpResponseModel> forgetPassword(String email);
}