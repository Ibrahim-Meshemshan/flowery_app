import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'password'.tr(context)),
    );
  }
}
