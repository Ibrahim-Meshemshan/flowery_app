import 'package:injectable/injectable.dart';
import '../../../../core/network/api_result.dart';
import '../../data/model/forget_password/otp_response_model.dart';
import '../repo/auth_repository.dart';

@injectable
class OtpUseCase {
  final AuthRepo _repo;

  OtpUseCase(this._repo);

  Future<ApiResult<OtpResponseModel>> call(String email) async {
    return await _repo.forgetPassword(email);
  }
}
