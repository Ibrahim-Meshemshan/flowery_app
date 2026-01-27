import 'package:flowery/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_form_field.dart';

class OtpBoxWidget extends StatelessWidget {
  const OtpBoxWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: CustomTextFormField(
        fillColor: AppColors.primaryGrey.withAlpha(125),
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        controller: controller,
        focusNode: focusNode,
        nextFocusNode: nextFocusNode,
        isPhone: true,
        maxLines: 1,
        enabled: true,
        onChanged: (value) {
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
          onChanged?.call(value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
