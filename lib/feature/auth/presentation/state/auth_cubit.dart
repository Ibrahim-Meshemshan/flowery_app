import 'package:bloc/bloc.dart';
import 'package:flowery/core/network/api_result.dart';
import 'package:flowery/feature/auth/domain/entity/login_request.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:flowery/feature/auth/domain/repo/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc_status/bloc_status.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../../../core/storage/sharedpreferences_helper.dart';
import '../../data/model/forget_password/otp_response_model.dart';
import '../../data/model/login/user_response_model.dart';
import '../../data/model/register/register_response_model.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../domain/usecase/otp_use_case.dart';
import '../../domain/usecase/register_use_case.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final OtpUseCase _otpUseCase;

  AuthCubit(this._loginUseCase,this._registerUseCase,this._otpUseCase) : super(AuthState());

  // ======================= login ==============================
  Future<void> login(LoginRequest login) async {
    emit(state.copyWith(login: const BlocStatus.loading()));

    final result = await _loginUseCase.call(login);

    switch (result) {
      case ApiSuccessResult():
        emit(
          state.copyWith(
            login: BlocStatus.success(data: result.data),
            authMode: AuthMode.authenticated,
          ),
        );

      case ApiErrorResult():
        emit(
          state.copyWith(
            login: BlocStatus.error(
              message: result.apiErrorModel.messageKey,
            ),
          ),
        );
    }
  }

  // ======================= login As Guest ==============================
  void enterAsGuest() {
    emit(state.copyWith(authMode: AuthMode.guest));
  }

  // ======================= register ==============================
  Future<void> register(RegisterRequest register) async {
    emit(state.copyWith(register: const BlocStatus.loading()));
    final result = await _registerUseCase.call(register);

    switch (result) {
      case ApiSuccessResult():
        emit(state.copyWith(register: BlocStatus.success(data: result.data)));

      case ApiErrorResult():
        emit(
          state.copyWith(
            register: BlocStatus.error(
              message: result.apiErrorModel.messageKey,
            ),
          ),
        );
    }
  }

  // ======================= forget password ==============================
  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(forgetPassword: const BlocStatus.loading()));
    final result = await _otpUseCase.call(email);

    switch (result) {
      case ApiSuccessResult():
        emit(state.copyWith(forgetPassword: BlocStatus.success(data: result.data)));

      case ApiErrorResult():
        emit(
          state.copyWith(
            forgetPassword: BlocStatus.error(
              message: result.apiErrorModel.messageKey,
            ),
          ),
        );
    }
  }

  // ======================== logout ================================
  Future<void> logout() async {
    await getIt<SharedPreferencesHelper>().clearToken();
    emit(AuthState());
  }
}
