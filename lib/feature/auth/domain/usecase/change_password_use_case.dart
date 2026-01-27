import 'package:injectable/injectable.dart';
import '../../../../core/network/api_result.dart';
import '../repo/auth_repository.dart';

@injectable
class ChangePasswordUseCase {
  final AuthRepo _repo;

  ChangePasswordUseCase(this._repo);

  Future<ApiResult<void>> call(String password, confirmPassword) async {
    return await _repo.changePassword(password, confirmPassword);
  }
}
