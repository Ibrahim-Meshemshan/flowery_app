import 'package:flutter/material.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/common/widgets/text_field/custom_text_form_field.dart';
import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/theme/app_colors.dart';
import 'package:flowery/core/theme/app_theme.dart';

import '../../../../../../core/common/functions/validation/app_validation.dart';
import '../screens/register_screen.dart';

class RegisterFormSection extends StatelessWidget {
  final bool enable;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  final FocusNode lastNameFocus;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;
  final FocusNode phoneFocus;

  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderChanged;

  const RegisterFormSection({
    super.key,
    required this.enable,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.lastNameFocus,
    required this.emailFocus,
    required this.passwordFocus,
    required this.confirmPasswordFocus,
    required this.phoneFocus,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          enabled: enable,
          controller: firstNameController,
          labelText: 'first_name'.tr(context),
          validator: (v) =>
              AppValidation.validateFullName(v, context),
          nextFocusNode: lastNameFocus,
        ),
        gapH16,

        CustomTextFormField(
          enabled: enable,
          controller: lastNameController,
          labelText: 'last_name'.tr(context),
          validator: (v) =>
              AppValidation.validateFullName(v, context),
          focusNode: lastNameFocus,
          nextFocusNode: emailFocus,
        ),
        gapH16,

        CustomTextFormField(
          enabled: enable,
          controller: emailController,
          isEmail: true,
          labelText: 'email'.tr(context),
          validator: (v) =>
              AppValidation.validateEmail(v, context),
          focusNode: emailFocus,
          nextFocusNode: passwordFocus,
        ),
        gapH16,

        CustomTextFormField(
          enabled: enable,
          controller: passwordController,
          isPassword: true,
          labelText: 'password'.tr(context),
          validator: (v) =>
              AppValidation.validatePassword(v, context),
          focusNode: passwordFocus,
          nextFocusNode: confirmPasswordFocus,
        ),
        gapH16,

        CustomTextFormField(
          enabled: enable,
          controller: confirmPasswordController,
          isPassword: true,
          labelText: 'confirm_password'.tr(context),
          validator: (v) =>
              AppValidation.validateConfirmPassword(
                v,
                passwordController.text,
                context,
              ),
          focusNode: confirmPasswordFocus,
          nextFocusNode: phoneFocus,
        ),
        gapH16,

        CustomTextFormField(
          enabled: enable,
          controller: phoneController,
          isPhone: true,
          labelText: 'phone_number'.tr(context),
          validator: (v) =>
              AppValidation.validatePhoneNumber(v, context),
          focusNode: phoneFocus,
        ),
        gapH24,

        Row(
          children: [
            Text(
              'gender'.tr(context),
              style: AppTheme.lightMode.textTheme.titleMedium,
            ),
            gapW8,

            Row(
              children: [
                Radio<Gender>(
                  activeColor: AppColors.primaryColor,
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (v) => onGenderChanged(v!),
                ),
                Text('male'.tr(context),style: AppTheme.lightMode.textTheme.titleMedium,),
              ],
            ),
            gapW8,
            Row(
              children: [
                Radio<Gender>(
                  activeColor: AppColors.primaryColor,
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (v) => onGenderChanged(v!),
                ),
                Text('female'.tr(context),style: AppTheme.lightMode.textTheme.titleMedium,),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
