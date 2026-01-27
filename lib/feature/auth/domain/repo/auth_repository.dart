import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';

import '../../data/model/forget_password/otp_response_model.dart';
import '../../data/model/register/register_response_model.dart';
import '../entity/login_request.dart';

abstract class AuthRepo {
  Future<ApiResult<UserResponseModel>> login(LoginRequest login);
  Future<ApiResult<RegisterResponseModel>> register(RegisterRequest register);
  Future<ApiResult<OtpResponseModel>> forgetPassword(String email);
  Future<ApiResult<void>> changePassword(String password,confirmPassword);
}