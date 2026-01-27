import 'package:flowery/core/bloc_status/bloc_status.dart';
import 'package:flowery/core/common/functions/navigator/navigator_services.dart';
import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flowery/core/common/widgets/app_utils/custom_snack_bar.dart';
import 'package:flowery/core/common/widgets/buttons/custom_button.dart';
import 'package:flowery/core/common/widgets/buttons/custom_text_button.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/dependency_injection/di.dart';
import 'package:flowery/core/route/routes_names.dart';
import 'package:flowery/core/theme/app_colors.dart';
import 'package:flowery/feature/auth/domain/entity/register_request.dart';
import 'package:flowery/feature/auth/presentation/state/auth_cubit.dart';
import 'package:flowery/feature/auth/presentation/ui/register/widgets/register_form-section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Gender { male, female }

class _RegisterScreenState extends State<RegisterScreen> {
  Gender? _selectedGender;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late FocusNode lastNameFocus;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode confirmPasswordFocus;
  late FocusNode phoneFocus;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    lastNameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
    phoneFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    lastNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'register'.tr(context)),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.register.isError) {
              AppUtils.snackBar(
                context: context,
                message: state.register.errorMessage ?? '',
                type: SnackType.error,
              );
            }
            if (state.register.isSuccess) {
              NavigatorService.pushReplacementNamed(RoutesNames.homeScreen);
              AppUtils.snackBar(
                context: context,
                message: 'register_successfully'.tr(context),
                type: SnackType.success,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      gapH20,
                      RegisterFormSection(
                        enable: !state.register.isLoading,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        phoneController: phoneController,
                        lastNameFocus: lastNameFocus,
                        emailFocus: emailFocus,
                        passwordFocus: passwordFocus,
                        confirmPasswordFocus: confirmPasswordFocus,
                        phoneFocus: phoneFocus,
                        selectedGender: _selectedGender,
                        onGenderChanged: (gender) {
                          setState(() {
                            _selectedGender = gender;
                          });
                        },
                      ),
                      gapH32,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'agree_creating_account'.tr(context),
                            style: AppTheme.lightMode.textTheme.bodyMedium,
                          ),
                          gapW4,
                          CustomTextButton(
                            isUnderlined: true,
                            onPressed: () {},
                            text: 'terms_and_conditions'.tr(context),
                          ),
                        ],
                      ),
                      gapH20,
                      CustomButton(
                        isLoading: state.register.isLoading,
                        text: 'register'.tr(context),
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            if (_selectedGender == null) {
                              AppUtils.snackBar(
                                context: context,
                                message: 'select_gender'.tr(context),
                                type: SnackType.error,
                              );
                              return;
                            }
                            context.read<AuthCubit>().register(
                              RegisterRequest(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneController.text,
                                gender: _selectedGender!.name,
                              ),
                            );
                          }
                        },
                      ),
                      gapH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('already_have_account'.tr(context)),
                          gapW8,
                          CustomTextButton(
                            text: 'login'.tr(context),
                            isUnderlined: true,
                            underlineColor: AppColors.primaryColor,
                            color: AppColors.primaryColor,
                            onPressed: () =>
                                NavigatorService.pushNamed(RoutesNames.loginScreen),
                          ),
                        ],
                      ),
                      gapH20,
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
