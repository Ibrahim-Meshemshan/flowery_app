// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../feature/auth/data/data_source/remote/auth_data_source.dart'
    as _i708;
import '../../feature/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i921;
import '../../feature/auth/data/repo/auth_repository_impl.dart' as _i33;
import '../../feature/auth/domain/repo/auth_repository.dart' as _i767;
import '../../feature/auth/presentation/state/auth_cubit.dart' as _i690;
import '../network/api_services.dart' as _i804;
import '../network/dio/dio_factory.dart' as _i638;
import '../network/network_info.dart' as _i932;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioFactory = _$DioFactory();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i361.Dio>(() => dioFactory.dio());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => networkModule.instance,
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
    gh.factory<_i690.AuthCubit>(() => _i690.AuthCubit(gh<_i767.AuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

class _$DioFactory extends _i638.DioFactory {}

class _$NetworkModule extends _i932.NetworkModule {}
