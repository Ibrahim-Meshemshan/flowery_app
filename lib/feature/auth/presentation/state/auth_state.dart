part of 'auth_cubit.dart';

enum AuthMode {
  authenticated,
  guest,
}


@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    @Default(AuthMode.guest) AuthMode authMode,
    @Default(BlocStatus.initial()) BlocStatus<UserResponseModel> login,
    @Default(BlocStatus.initial()) BlocStatus<RegisterResponseModel> register,
    @Default(BlocStatus.initial()) BlocStatus<OtpResponseModel> forgetPassword,
    @Default(BlocStatus.initial()) BlocStatus<void> changePassword,
  }) = _AuthState;
}
