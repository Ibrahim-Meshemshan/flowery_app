// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 AuthMode get authMode; BlocStatus<UserResponseModel> get login; BlocStatus<RegisterResponseModel> get register; BlocStatus<OtpResponseModel> get forgetPassword; BlocStatus<void> get changePassword;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.authMode, authMode) || other.authMode == authMode)&&(identical(other.login, login) || other.login == login)&&(identical(other.register, register) || other.register == register)&&(identical(other.forgetPassword, forgetPassword) || other.forgetPassword == forgetPassword)&&(identical(other.changePassword, changePassword) || other.changePassword == changePassword));
}


@override
int get hashCode => Object.hash(runtimeType,authMode,login,register,forgetPassword,changePassword);

@override
String toString() {
  return 'AuthState(authMode: $authMode, login: $login, register: $register, forgetPassword: $forgetPassword, changePassword: $changePassword)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthMode authMode, BlocStatus<UserResponseModel> login, BlocStatus<RegisterResponseModel> register, BlocStatus<OtpResponseModel> forgetPassword, BlocStatus<void> changePassword
});


$BlocStatusCopyWith<UserResponseModel, $Res> get login;$BlocStatusCopyWith<RegisterResponseModel, $Res> get register;$BlocStatusCopyWith<OtpResponseModel, $Res> get forgetPassword;$BlocStatusCopyWith<void, $Res> get changePassword;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authMode = null,Object? login = null,Object? register = null,Object? forgetPassword = null,Object? changePassword = null,}) {
  return _then(_self.copyWith(
authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as AuthMode,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as BlocStatus<UserResponseModel>,register: null == register ? _self.register : register // ignore: cast_nullable_to_non_nullable
as BlocStatus<RegisterResponseModel>,forgetPassword: null == forgetPassword ? _self.forgetPassword : forgetPassword // ignore: cast_nullable_to_non_nullable
as BlocStatus<OtpResponseModel>,changePassword: null == changePassword ? _self.changePassword : changePassword // ignore: cast_nullable_to_non_nullable
as BlocStatus<void>,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<UserResponseModel, $Res> get login {
  
  return $BlocStatusCopyWith<UserResponseModel, $Res>(_self.login, (value) {
    return _then(_self.copyWith(login: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<RegisterResponseModel, $Res> get register {
  
  return $BlocStatusCopyWith<RegisterResponseModel, $Res>(_self.register, (value) {
    return _then(_self.copyWith(register: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<OtpResponseModel, $Res> get forgetPassword {
  
  return $BlocStatusCopyWith<OtpResponseModel, $Res>(_self.forgetPassword, (value) {
    return _then(_self.copyWith(forgetPassword: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<void, $Res> get changePassword {
  
  return $BlocStatusCopyWith<void, $Res>(_self.changePassword, (value) {
    return _then(_self.copyWith(changePassword: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthMode authMode,  BlocStatus<UserResponseModel> login,  BlocStatus<RegisterResponseModel> register,  BlocStatus<OtpResponseModel> forgetPassword,  BlocStatus<void> changePassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.authMode,_that.login,_that.register,_that.forgetPassword,_that.changePassword);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthMode authMode,  BlocStatus<UserResponseModel> login,  BlocStatus<RegisterResponseModel> register,  BlocStatus<OtpResponseModel> forgetPassword,  BlocStatus<void> changePassword)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.authMode,_that.login,_that.register,_that.forgetPassword,_that.changePassword);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthMode authMode,  BlocStatus<UserResponseModel> login,  BlocStatus<RegisterResponseModel> register,  BlocStatus<OtpResponseModel> forgetPassword,  BlocStatus<void> changePassword)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.authMode,_that.login,_that.register,_that.forgetPassword,_that.changePassword);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
   _AuthState({this.authMode = AuthMode.guest, this.login = const BlocStatus.initial(), this.register = const BlocStatus.initial(), this.forgetPassword = const BlocStatus.initial(), this.changePassword = const BlocStatus.initial()});
  

@override@JsonKey() final  AuthMode authMode;
@override@JsonKey() final  BlocStatus<UserResponseModel> login;
@override@JsonKey() final  BlocStatus<RegisterResponseModel> register;
@override@JsonKey() final  BlocStatus<OtpResponseModel> forgetPassword;
@override@JsonKey() final  BlocStatus<void> changePassword;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.authMode, authMode) || other.authMode == authMode)&&(identical(other.login, login) || other.login == login)&&(identical(other.register, register) || other.register == register)&&(identical(other.forgetPassword, forgetPassword) || other.forgetPassword == forgetPassword)&&(identical(other.changePassword, changePassword) || other.changePassword == changePassword));
}


@override
int get hashCode => Object.hash(runtimeType,authMode,login,register,forgetPassword,changePassword);

@override
String toString() {
  return 'AuthState(authMode: $authMode, login: $login, register: $register, forgetPassword: $forgetPassword, changePassword: $changePassword)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthMode authMode, BlocStatus<UserResponseModel> login, BlocStatus<RegisterResponseModel> register, BlocStatus<OtpResponseModel> forgetPassword, BlocStatus<void> changePassword
});


@override $BlocStatusCopyWith<UserResponseModel, $Res> get login;@override $BlocStatusCopyWith<RegisterResponseModel, $Res> get register;@override $BlocStatusCopyWith<OtpResponseModel, $Res> get forgetPassword;@override $BlocStatusCopyWith<void, $Res> get changePassword;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authMode = null,Object? login = null,Object? register = null,Object? forgetPassword = null,Object? changePassword = null,}) {
  return _then(_AuthState(
authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as AuthMode,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as BlocStatus<UserResponseModel>,register: null == register ? _self.register : register // ignore: cast_nullable_to_non_nullable
as BlocStatus<RegisterResponseModel>,forgetPassword: null == forgetPassword ? _self.forgetPassword : forgetPassword // ignore: cast_nullable_to_non_nullable
as BlocStatus<OtpResponseModel>,changePassword: null == changePassword ? _self.changePassword : changePassword // ignore: cast_nullable_to_non_nullable
as BlocStatus<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<UserResponseModel, $Res> get login {
  
  return $BlocStatusCopyWith<UserResponseModel, $Res>(_self.login, (value) {
    return _then(_self.copyWith(login: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<RegisterResponseModel, $Res> get register {
  
  return $BlocStatusCopyWith<RegisterResponseModel, $Res>(_self.register, (value) {
    return _then(_self.copyWith(register: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<OtpResponseModel, $Res> get forgetPassword {
  
  return $BlocStatusCopyWith<OtpResponseModel, $Res>(_self.forgetPassword, (value) {
    return _then(_self.copyWith(forgetPassword: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<void, $Res> get changePassword {
  
  return $BlocStatusCopyWith<void, $Res>(_self.changePassword, (value) {
    return _then(_self.copyWith(changePassword: value));
  });
}
}

// dart format on
