// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/auth/data/data_source/remote/auth_data_source.dart'
    as _i708;
import '../../feature/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i921;
import '../../feature/auth/data/repo/auth_repository_impl.dart' as _i33;
import '../../feature/auth/domain/repo/auth_repository.dart' as _i767;
import '../../feature/auth/domain/usecase/change_password_use_case.dart'
    as _i543;
import '../../feature/auth/domain/usecase/login_use_case.dart' as _i805;
import '../../feature/auth/domain/usecase/otp_use_case.dart' as _i661;
import '../../feature/auth/domain/usecase/register_use_case.dart' as _i717;
import '../../feature/auth/presentation/state/auth_cubit.dart' as _i690;
import '../network/api_services.dart' as _i804;
import '../network/dio/dio_factory.dart' as _i638;
import '../network/network_info.dart' as _i932;
import '../storage/sharedpreferences_helper.dart' as _i44;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioFactory = _$DioFactory();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioFactory.dio());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => networkModule.instance,
    );
    gh.lazySingleton<_i44.SharedPreferencesHelper>(
      () => _i44.SharedPreferencesHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(
        instance: gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.lazySingleton<_i804.ApiService>(() => _i804.ApiService(gh<_i361.Dio>()));
    gh.factory<_i708.AuthDataSource>(
      () => _i921.AuthRemoteDataSourceImpl(apiService: gh<_i804.ApiService>()),
    );
    gh.factory<_i767.AuthRepo>(
      () => _i33.AuthRepositoryImpl(
        authDataSource: gh<_i708.AuthDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i543.ChangePasswordUseCase>(
      () => _i543.ChangePasswordUseCase(gh<_i767.AuthRepo>()),
    );
    gh.factory<_i805.LoginUseCase>(
      () => _i805.LoginUseCase(gh<_i767.AuthRepo>()),
    );
    gh.factory<_i661.OtpUseCase>(() => _i661.OtpUseCase(gh<_i767.AuthRepo>()));
    gh.factory<_i717.RegisterUseCase>(
      () => _i717.RegisterUseCase(gh<_i767.AuthRepo>()),
    );
    gh.factory<_i690.AuthCubit>(
      () => _i690.AuthCubit(
        gh<_i805.LoginUseCase>(),
        gh<_i717.RegisterUseCase>(),
        gh<_i661.OtpUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i44.RegisterModule {}

class _$DioFactory extends _i638.DioFactory {}

class _$NetworkModule extends _i932.NetworkModule {}
