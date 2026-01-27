import 'package:flowery/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.errorBorder,
    this.enableBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.focusNode,
    this.nextFocusNode,
    this.validator,
    this.onChanged,
    this.controller,
    this.isPassword = false,
    this.isPhone = false,
    this.isEmail = false,
    this.maxLines,
    this.enabled = true,
    this.textAlign,
    this.textStyle,
    this.filled,
    this.fillColor,
    this.focusColor,
  });

  // Text
  final String? hintText;
  final TextStyle? hintStyle,textStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextAlign? textAlign;
  final Color? fillColor,focusColor;
  // Borders
  final InputBorder? errorBorder;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;

  // Nodes
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  // Logic
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? enabled;

  // Types
  final bool isPassword;
  final bool isPhone;
  final bool isEmail;
  final bool? filled;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign ?? TextAlign.start,
      enabled: widget.enabled ?? true,
      cursorColor: AppColors.primaryColor,
      minLines: 1,
      maxLines: widget.isPassword ? 1 : widget.maxLines ?? 1,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword && !isPasswordVisible,
      keyboardType: _getKeyboardType(),
      style: widget.textStyle ??  AppTheme.lightMode.textTheme.bodyMedium,
      validator: widget.validator,
      onFieldSubmitted: (_) {
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        filled: widget.filled ?? true,
        fillColor: widget.fillColor ?? AppColors.whiteColor,
        focusColor: widget.focusColor,
        label: Text(widget.labelText ?? ''),
        labelStyle:
            widget.labelStyle ??
            TextStyle(color: AppColors.hintGrey, fontSize: 14),
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            TextStyle(color: AppColors.hintGrey, fontSize: 14),

        // Borders
        enabledBorder:
            widget.enableBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryGrey),
            ),

        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.errorColor),
            ),
        errorBorder:
            widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.errorColor),
            ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryGrey),
        ),

        // Password Icon
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryGrey,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    if (widget.isPhone) return TextInputType.phone;
    if (widget.isEmail) return TextInputType.emailAddress;
    return TextInputType.text;
  }
}
