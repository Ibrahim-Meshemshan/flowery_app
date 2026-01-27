import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/feature/auth/data/model/forget_password/otp_response_model.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:flowery/feature/auth/domain/usecase/otp_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo repo;
  late OtpUseCase otpUseCase;
  setUp(() {
    repo = MockAuthRepo();
    otpUseCase = OtpUseCase(repo);
  });
  test('should return call forget password from repository', () async {
    // arrange
    final String email = 'testEmail@gmai;.com';
    final expectedResult = ApiSuccessResult<OtpResponseModel>(
      data: OtpResponseModel(message: 'message', info: 'info'),
    );
    provideDummy<ApiResult<OtpResponseModel>>(expectedResult);
    when(repo.forgetPassword(any)).thenAnswer((_) async => expectedResult);
    // act
    final actual = await otpUseCase.call(email);
    // assert
    verify(repo.forgetPassword(email)).called(1);
    expect(actual, isA<ApiResult<OtpResponseModel>>());
  });
}
