import 'package:injectable/injectable.dart';
import '../../../../core/network/api_result.dart';
import '../../data/model/register/register_response_model.dart';
import '../entity/register_request.dart';
import '../repo/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _repo;

  RegisterUseCase(this._repo);

  Future<ApiResult<RegisterResponseModel>> call(RegisterRequest register) async {
    return await _repo.register(register);
  }
}
