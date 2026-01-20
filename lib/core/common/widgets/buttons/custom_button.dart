import 'package:flowery/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.height = 48,
    this.borderRadius = 35,
    this.backgroundColor,
    this.textStyle,
    this.borderSide,
  });

  final String text;
  final VoidCallback? onPressed;

  // States
  final bool isLoading;
  final bool enabled;

  // UI
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !enabled || isLoading;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          disabledBackgroundColor: AppColors.primaryGrey,
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.whiteColor,
                  ),
                ),
              )
            : Text(
                text,
                style:
                    textStyle ??
                    AppTheme.lightMode.textTheme.titleMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
      ),
    );
  }
}
