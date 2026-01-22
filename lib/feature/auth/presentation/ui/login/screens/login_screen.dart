import 'package:flowery/core/bloc_status/bloc_status.dart';
import 'package:flowery/core/common/functions/navigator/navigator_services.dart';
import 'package:flowery/core/common/functions/validation/app_validation.dart';
import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flowery/core/common/widgets/app_utils/custom_snack_bar.dart';
import 'package:flowery/core/common/widgets/buttons/custom_button.dart';
import 'package:flowery/core/common/widgets/buttons/custom_text_button.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/common/widgets/text_field/custom_text_form_field.dart';
import 'package:flowery/core/route/routes_names.dart';
import 'package:flowery/core/storage/sharedpreferences_helper.dart';
import 'package:flowery/core/theme/app_colors.dart';
import 'package:flowery/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/dependency_injection/di.dart';
import '../../../../domain/entity/login_request.dart';
import '../../../state/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode loginFocus;
  late FocusNode passwordFocus;
  bool isCheckRemember = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController(
      text: 'ibrahimabdullahmshmshan@gmail.com',
    );
    passwordController = TextEditingController(text: "Ibrahimabdullah \$21655");
    loginFocus = FocusNode();
    passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    loginFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'login'.tr(context)),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state.login.isError) {
              AppUtils.snackBar(
                context: context,
                message: state.login.errorMessage?.tr(context) ?? '',
                type: SnackType.error,
              );
            }
            if (state.login.isSuccess) {
              if (isCheckRemember) {
                await getIt<SharedPreferencesHelper>().saveToken(
                  state.login.data.token,
                );
              }
              NavigatorService.pushReplacementNamed(RoutesNames.home);
              AppUtils.snackBar(
                context: context,
                message: 'login_successfully'.tr(context),
                type: SnackType.success,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome_back'.tr(context),
                        style: AppTheme.lightMode.textTheme.titleLarge
                            ?.copyWith(fontSize: 22),
                      ),
                      gapH16,
                      CustomTextFormField(
                        enabled: !state.login.isLoading,
                        isEmail: true,
                        validator: (value) =>
                            AppValidation.validateEmail(value, context),
                        labelText: "email".tr(context),
                        focusNode: loginFocus,
                        nextFocusNode: passwordFocus,
                        controller: emailController,
                      ),
                      gapH20,
                      CustomTextFormField(
                        enabled: !state.login.isLoading,
                        isPassword: true,
                        validator: (value) =>
                            AppValidation.validatePassword(value, context),
                        labelText: "password".tr(context),
                        focusNode: passwordFocus,
                        controller: passwordController,
                      ),
                      gapH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isCheckRemember,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    isCheckRemember = value!;
                                  });
                                },
                              ),
                              Text(
                                "remember_me".tr(context),
                                style: AppTheme.lightMode.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          CustomTextButton(
                            isUnderlined: true,
                            text: 'forget_password'.tr(context),
                            onPressed: () =>
                                NavigatorService.pushNamed(
                                  RoutesNames.forgetPassword,
                                ),
                          ),
                        ],
                      ),
                      gapH40,
                      CustomButton(
                        text: 'login'.tr(context),
                        isLoading: state.login.isLoading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                              LoginRequest(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                      ),
                      gapH20,
                      CustomButton(
                        borderSide: BorderSide(color: AppColors.primaryGrey),
                        textStyle: AppTheme.lightMode.textTheme.titleMedium
                            ?.copyWith(color: AppColors.hintGrey),
                        backgroundColor: AppColors.whiteColor,
                        text: 'continue_as_guest'.tr(context),
                        onPressed: () {
                          context.read<AuthCubit>().enterAsGuest();
                          NavigatorService.pushNamed(RoutesNames.home);
                        },
                      ),
                      gapH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("don't_have_account".tr(context)),
                          gapW4,
                          CustomTextButton(
                            isUnderlined: true,
                            underlineColor: AppColors.primaryColor,
                            color: AppColors.primaryColor,
                            text: 'register'.tr(context),
                            onPressed: () =>
                                NavigatorService.pushNamed(
                                  RoutesNames.register,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
