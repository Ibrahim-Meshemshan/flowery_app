import 'package:flowery/core/network/api_constant.dart';
import 'package:flowery/feature/auth/data/data_source/remote/auth_data_source.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/api_services.dart';
import '../../../domain/entity/login_request.dart';
import '../../model/forget_password/otp_response_model.dart';
import '../../model/login/user_response_model.dart';
import '../../model/register/register_response_model.dart';

@Injectable(as: AuthDataSource)
class AuthRemoteDataSourceImpl implements AuthDataSource {
  ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  // ======================= login =========================
  @override
  Future<UserResponseModel> login(LoginRequest login) async {
    final jsonParams = login.toJson();
    final response = await apiService.post(
      url: ApiConstants.login,
      data: jsonParams,
    );
    return UserResponseModel.fromJson(response.data);
  }

  // ======================= register =========================
  @override
  Future<RegisterResponseModel> register(RegisterRequest register) async {
    final jsonParams = register.toJson();
    final response = await apiService.post(
      url: ApiConstants.register,
      data: jsonParams,
    );
    return RegisterResponseModel.fromJson(response.data);
  }

  // ======================= Forget Password =========================
  @override
  Future<OtpResponseModel> forgetPassword(String email) async {
    final response = await apiService.post(
      url: ApiConstants.forgetPassword,
      data: {'email': email},
    );
    return OtpResponseModel.fromJson(response.data);
  }
  //

  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: ['email', 'profile'],
  //   serverClientId:
  //       '888707995532-83pin14vunsr380i3makn05mc8174rqk.apps.googleusercontent.com',
  // );
  //
  // // instance from faceBook package
  // Future<UserCredential> signInWithGoogle() async {
  //   await _googleSignIn.signOut();
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //   if (googleUser == null) {
  //     throw Exception('Google Sign In aborted');
  //   }
  //
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //   print("Access Token: ${googleAuth.accessToken}");
  //   print("ID Token: ${googleAuth.idToken}");
  //   if (googleAuth.accessToken == null || googleAuth.idToken == null) {
  //     throw Exception('Missing Google Auth Token');
  //   }
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  //  ============================= login  =============================

  //
  // //  ============================= register  =============================
  // Future<Registermodel> register(RegisterRequest register) async {
  //   final response = await apiService.post(url: ApiConstants.register);
  //   return Registermodel.fromJson(response.data);
  // }
}
