import 'package:flowery/core/bloc_status/bloc_status.dart';
import 'package:flowery/core/common/functions/navigator/navigator_services.dart';
import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flowery/core/common/widgets/app_utils/custom_snack_bar.dart';
import 'package:flowery/core/common/widgets/buttons/custom_button.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/common/widgets/text_field/custom_text_form_field.dart';
import 'package:flowery/core/dependency_injection/di.dart';
import 'package:flowery/core/theme/app_theme.dart';
import 'package:flowery/feature/auth/presentation/state/auth_cubit.dart';
import 'package:flowery/feature/auth/presentation/ui/forget_password/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/functions/validation/app_validation.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController(
      text: 'ibrahimabdullahmshmshan@gmail.com',
    );
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'password'.tr(context)),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.forgetPassword.isError) {
              AppUtils.snackBar(
                context: context,
                message: state.forgetPassword.errorMessage ?? '',
                type: SnackType.error,
              );
            }
            if (state.forgetPassword.isSuccess) {
              AppUtils.snackBar(
                context: context,
                message: 'otp_sent_to_your_email'.tr(context),
                type: SnackType.success,
              );
              NavigatorService.pushReplacement(OTPScreen());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  gapH30,
                  Text(
                    'forget_password'.tr(context),
                    style: AppTheme.lightMode.textTheme.titleLarge,
                  ),
                  gapH20,
                  Text(
                    'enter_your_email_associated'.tr(context),
                    textAlign: TextAlign.center,
                  ),
                  gapH20,
                  CustomTextFormField(
                    controller: emailController,
                    isEmail: true,
                    labelText: 'email'.tr(context),
                    validator: (v) => AppValidation.validateEmail(v, context),
                  ),

                  gapH50,
                  CustomButton(
                    isLoading: state.forgetPassword.isLoading,
                    text: 'continuo'.tr(context),
                    onPressed: () => context.read<AuthCubit>().forgetPassword(
                      emailController.text,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
