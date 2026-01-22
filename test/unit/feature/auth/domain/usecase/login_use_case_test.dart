import 'package:flowery/core/network/api_error_handler.dart';
import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:flowery/feature/auth/domain/usecase/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_use_case_test.mocks.dart';

// arrange:  => preparing objects and what i need for test
// act:  => make required behavior for test
// assert:  => is behavior is correct or not
@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo repo;
  late LoginUseCase loginUseCase;
  var loginRequest = LoginRequest(
    email: 'testEmail@gmail.com',
    password: 'testPassword\$21655',
  );
  setUpAll(() {
    // mock object
    repo = MockAuthRepo();
    loginUseCase = LoginUseCase(repo);
  });
  group('TODO: test login use case with two path', () {
    test('should call login method from repository', () async {
      // arrange
      // mock object

      // mock data
      var expectedResult = ApiSuccessResult<UserResponseModel>(
        data: UserResponseModel(
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
      // mock behavior
      provideDummy<ApiResult<UserResponseModel>>(expectedResult);
      when(repo.login(any)).thenAnswer((_) async => expectedResult);

      // act
      var actual = await loginUseCase.call(loginRequest);

      // assert
      verify(
        repo.login(loginRequest),
      ).called(1); // needs mock object and method
      expect(actual, expectedResult);
    });
    // test('should return error when call login method from repository', () async{
    //   // arrange
    //   var expectedError = ApiErrorResult<UserResponseModel>(apiErrorModel: Exception());
    //   provideDummy<ApiResult<UserResponseModel>>(expectedError);
    //   when(repo.login(any)).thenThrow(expectedError);
    //   // act
    //   var actual = await loginUseCase.call(loginRequest);
    //   // assert
    //   verify(repo.login(loginRequest)).called(1);
    //   expect(actual, isA<ApiErrorResult<UserResponseModel>>());
    // });

  });
}
