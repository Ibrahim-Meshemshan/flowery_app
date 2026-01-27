import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:flowery/feature/auth/data/model/register/register_response_model.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:flowery/feature/auth/domain/usecase/register_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo repo;
  late RegisterUseCase registerUseCase;

  setUpAll(() {
    repo = MockAuthRepo();
    registerUseCase = RegisterUseCase(repo);
  });
  test('should call register method from repository', () async {
    // arrange
    var register = RegisterRequest(
      firstName: 'firstName',
      lastName: 'lastName',
      email: 'email',
      password: 'password',
      confirmPassword: 'confirmPassword',
      phone: 'phone',
      gender: 'gender',
    );
    var expectedResult = ApiSuccessResult<RegisterResponseModel>(
      data: RegisterResponseModel(
        message: 'message',
        user: UserModel(
          id: 'id',
          firstName: 'firstName',
          lastName: 'lastName',
          email: 'email',
          gender: 'gender',
          phone: 'phone',
          photo: 'photo',
          role: 'role',
          wishlist: ['wishlist'],
          addresses: ['addresses'],
          createdAt: DateTime.now(),
        ),
        token: 'token',
      ),
    );
    provideDummy<ApiResult<RegisterResponseModel>>(expectedResult);
    when(repo.register(any)).thenAnswer((_) async => expectedResult);
    // act
    // the behavior is
    var actual = await registerUseCase.call(register);

    // assert
    verify(repo.register(register)).called(1);
    expect(actual, isA<ApiSuccessResult<RegisterResponseModel>>());
  });
}
