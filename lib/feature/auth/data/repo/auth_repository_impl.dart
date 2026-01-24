import 'package:flowery/core/helper_functions/base_repo.dart';
import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/core/network/network_info.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flowery/feature/auth/data/model/register/register_response_model.dart';
import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/register_request.dart';
import '../../domain/repo/auth_repository.dart';
import '../data_source/remote/auth_data_source.dart';
import '../data_source/remote/auth_remote_data_source.dart';
import '../model/forget_password/otp_response_model.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl extends BaseRepo implements AuthRepo {
  AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
    required super.networkInfo,
  });

  @override
  Future<ApiResult<UserResponseModel>> login(LoginRequest login) async {
    return callApi(() => authDataSource.login(login));
  }

  @override
  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequest register,
  ) async {
    return callApi(() => authDataSource.register(register));
  }

  @override
  Future<ApiResult<OtpResponseModel>> forgetPassword(String email) {
    return callApi(() => authDataSource.forgetPassword(email));
  }
}
