import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/core/network/network_info.dart';

import 'package:flowery/feature/auth/data/data_source/remote/auth_data_source.dart';
import 'package:flowery/feature/auth/data/model/login/user_model.dart';
import 'package:flowery/feature/auth/data/model/login/user_response_model.dart';
import 'package:flowery/feature/auth/data/model/register/register_response_model.dart';
import 'package:flowery/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthDataSource, NetworkInfo])
void main() {
  late MockAuthDataSource authDataSource;
  late MockNetworkInfo networkInfo;
  late AuthRepo autRepo;

  setUp(() {
    authDataSource = MockAuthDataSource();
    networkInfo = MockNetworkInfo();
    autRepo = AuthRepositoryImpl(
      authDataSource: authDataSource,
      networkInfo: networkInfo,
    );
    when(networkInfo.isConnected).thenAnswer((_) async => true);
  });

  group('TODO: test login method with success and error', () {
    var login = LoginRequest(email: 'email', password: 'password');
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
      verify(authDataSource.login(any)).called(1);
      expect(actual, isA<ApiSuccessResult<UserResponseModel>>());
    });
    test('should return error when no internet', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(authDataSource.login(login)).thenThrow(Exception());
      // act
      final actual = await autRepo.login(
        LoginRequest(email: 'a', password: 'b'),
      );

      // assert
      verifyNever(authDataSource.login(any));
      expect(actual, isA<ApiResult<UserResponseModel>>());
    });
  });

  group('TODO: test register method with success and error', () {
    var register = RegisterRequest(
      confirmPassword: 'confirm',
      firstName: 'firstName',
      lastName: 'lastName',
      email: 'email@gmail.com',
      password: 'password',
      phone: 'phone',
      gender: 'gender',
    );
    test('should call register from auth data source', () async {
      // arrange
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
        authDataSource.register(any),
      ).thenAnswer((_) async => expectedResult);
      // act
      var actual = await autRepo.register(register);
      // assert
      verify(authDataSource.register(any)).called(1);
      expect(actual, isA<ApiResult<RegisterResponseModel>>());
    });

    test('should return error with no internet', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(authDataSource.register(register)).thenThrow(Exception());
      // act
      final actual = await autRepo.register(register);
      // assert
      verifyNever(authDataSource.register(any));
      expect(actual, isA<ApiResult<RegisterResponseModel>>());
    });
  });
}
