import 'package:flowery/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.underlineColor,
    this.textStyle,
    this.isUnderlined = false,
    this.alignment = Alignment.center,
  });

  final String text;
  final VoidCallback? onPressed;

  // UI
  final Color? color,underlineColor;
  final TextStyle? textStyle;
  final bool isUnderlined;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style:
              textStyle ??
              AppTheme.lightMode.textTheme.titleMedium ?.copyWith(
                color: color ?? AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                decorationColor: underlineColor ?? AppColors.primaryColor,
                decoration: isUnderlined ? TextDecoration.underline : null,
              ),
        ),
      ),
    );
  }
}
