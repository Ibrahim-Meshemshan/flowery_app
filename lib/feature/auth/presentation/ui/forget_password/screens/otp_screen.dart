import 'package:flowery/core/common/functions/navigator/navigator_services.dart';
import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flowery/core/common/widgets/buttons/custom_text_button.dart';
import 'package:flowery/core/common/widgets/sized_box/gap_sized.dart';
import 'package:flowery/core/dependency_injection/di.dart' show getIt;
import 'package:flowery/core/theme/app_colors.dart';
import 'package:flowery/core/theme/app_theme.dart';
import 'package:flowery/feature/auth/presentation/state/auth_cubit.dart';
import 'package:flowery/feature/auth/presentation/ui/forget_password/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/text/custom_text.dart';
import '../widget/otp_box_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final controllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'password'.tr(context)),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'email_verify_cation'.tr(context),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              gapH12,
              Text(
                textAlign: TextAlign.center,
                'enter_code'.tr(context),
                style: TextStyle(color: Colors.grey),
              ),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                      (index) =>
                      OtpBoxWidget(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        nextFocusNode: index < 5 ? focusNodes[index + 1] :  null,
                        onChanged: (value) {
                        },
                      ),
                ),
              ),
              gapH50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text:"didn't_receive_code".tr(context)),
                  gapW8,
                  CustomTextButton(
                    isUnderlined: true,
                    text: 'resend'.tr(context),
                    onPressed: () => NavigatorService.pushReplacement(ChangePasswordScreen()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
