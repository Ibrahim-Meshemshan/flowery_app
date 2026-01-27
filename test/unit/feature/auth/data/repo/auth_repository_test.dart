import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/core/network/network_info.dart';

import 'package:flowery/feature/auth/data/data_source/remote/auth_data_source.dart';
import 'package:flowery/feature/auth/data/model/forget_password/otp_response_model.dart';
import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flowery/feature/auth/data/model/register/register_response_model.dart';
import 'package:flowery/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthDataSource, NetworkInfo])
void main() {
  late MockAuthDataSource authDataSource;
  late MockNetworkInfo networkInfo;
  late AuthRepo autRepo;
  var login = LoginRequest(email: 'email', password: 'password');
  var register = RegisterRequest(
    confirmPassword: 'confirm',
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email@gmail.com',
    password: 'password',
    phone: 'phone',
    gender: 'gender',
  );
  var email = 'testEmail@gmail.com';
  setUp(() {
    authDataSource = MockAuthDataSource();
    networkInfo = MockNetworkInfo();
    autRepo = AuthRepositoryImpl(
      authDataSource: authDataSource,
      networkInfo: networkInfo,
    );
    when(networkInfo.isConnected).thenAnswer((_) async => true);
  });

  group('TODO: implement test happy path login and register', () {
    test("should call login from auth data source", () async {
      // arrange
      var expectedResult = UserResponseModel(
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
      );
      provideDummy<UserResponseModel>(expectedResult);
      when(authDataSource.login(any)).thenAnswer((_) async => expectedResult);
      // act
      var actual = await autRepo.login(login);
      // assert
      verify(authDataSource.login(login)).called(1);
      expect(actual, isA<ApiSuccessResult<UserResponseModel>>());
    });
    test('should call register from auth data source', () async {
      // arrange

      // act
      var expectedResult = RegisterResponseModel(
        message: '',
        user: UserModel(
          id: '',
          firstName: '',
          lastName: '',
          email: '',
          gender: '',
          phone: '',
          photo: '',
          role: '',
          wishlist: [],
          addresses: [],
          createdAt: DateTime.now(),
        ),
        token: '',
      );
      provideDummy<RegisterResponseModel>(expectedResult);
      when(
        authDataSource.register(register),
      ).thenAnswer((_) async => expectedResult);
      var actual = await autRepo.register(register);
      // assert
      verify(authDataSource.register(register)).called(1);
      expect(actual, isA<ApiSuccessResult<RegisterResponseModel>>());
    });
  });

  group('TODO: implement test wrong path login and register', () {
    test(
      'should be return error when no internet with login function',
      () async {
        // arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(authDataSource.login(login)).thenThrow(Exception());
        // act
        final actualLogin = await autRepo.login(
          LoginRequest(email: 'a', password: 'b'),
        );
        final actualRegister = await autRepo.register(
          RegisterRequest(
            email: 'a',
            password: 'b',
            firstName: 'c',
            lastName: 'd',
            confirmPassword: 'e',
            phone: 'f',
            gender: 'g',
          ),
        );

        // assert
        verifyNever(authDataSource.login(any));
        verifyNever(authDataSource.register(any));
        expect(actualLogin, isA<ApiResult<UserResponseModel>>());
        expect(actualRegister, isA<ApiResult<RegisterResponseModel>>());
      },
    );

    test(
      'should be return error when no internet with register function',
      () async {
        // arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(authDataSource.register(register)).thenThrow(Exception());
        // act
        final actualRegister = await autRepo.register(
          RegisterRequest(
            email: 'a',
            password: 'b',
            firstName: 'c',
            lastName: 'd',
            confirmPassword: 'e',
            phone: 'f',
            gender: 'g',
          ),
        );

        // assert
        verifyNever(authDataSource.register(any));
        expect(actualRegister, isA<ApiResult<RegisterResponseModel>>());
      },
    );
  });

  group('TODO: implement test forget password', () {
    test('should be call forget password from data source', () async {
      // arrange
      final expectedResult = OtpResponseModel(message: 'message', info: 'info');
      provideDummy<OtpResponseModel>(expectedResult);
      when(
        authDataSource.forgetPassword(any),
      ).thenAnswer((_) async => expectedResult);
      // act
      final actual = await autRepo.forgetPassword(email);
      // assert
      verify(authDataSource.forgetPassword(email)).called(1);
      expect(actual, isA<ApiSuccessResult<OtpResponseModel>>());
    });
    test('should be return error when call forget password from data source', () async{
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(authDataSource.forgetPassword(any)).thenThrow(Exception());
      // act
      final actual = await autRepo.forgetPassword(email);
      // assert
      verifyNever(authDataSource.forgetPassword(any));
      expect(actual, isA<ApiErrorResult<OtpResponseModel>>());
    });

  });
}
