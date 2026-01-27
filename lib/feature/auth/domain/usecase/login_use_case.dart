import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../../data/model/login/user_response_model.dart';
import '../repo/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepo _repo;

  LoginUseCase(this._repo);

  Future<ApiResult<UserResponseModel>> call(LoginRequest login) async {
    return await _repo.login(login);
  }
}
