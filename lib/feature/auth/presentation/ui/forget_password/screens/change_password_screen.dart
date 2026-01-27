import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/buttons/custom_button.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/common/widgets/text/custom_text.dart';
import 'package:flowery/core/common/widgets/text_field/custom_text_form_field.dart';
import 'package:flowery/core/theme/app_colors.dart';
import 'package:flowery/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/functions/validation/app_validation.dart';
import '../../../../../../core/common/widgets/appBar/custom_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode confirmPasswordFocus;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    confirmPasswordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'change_password'.tr(context)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'reset_password'.tr(context),
              style: AppTheme.lightMode.textTheme.titleLarge,
            ),
            gapH10,
            CustomText(
              text: 'password_contain_char'.tr(context),
              color: AppColors.primaryGrey,
              textAlign: TextAlign.center,
            ),
            gapH20,
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              labelText: 'password'.tr(context),
              validator: (v) => AppValidation.validatePassword(v, context),
              nextFocusNode: confirmPasswordFocus,
            ),
            gapH16,

            CustomTextFormField(
              controller: confirmPasswordController,
              isPassword: true,
              labelText: 'confirm_password'.tr(context),
              validator: (v) => AppValidation.validateConfirmPassword(
                v,
                passwordController.text,
                context,
              ),
              focusNode: confirmPasswordFocus,
            ),
            gapH50,
            CustomButton(text: 'confirm'.tr(context), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
