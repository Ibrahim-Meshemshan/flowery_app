import 'package:flutter/material.dart';
import 'package:flowery/core/theme/app_theme.dart';
import 'package:flowery/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {
        super.key,
        required this.text,
        this.style,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.decoration,
      });

  final String text;

  /// Base style from Theme
  final TextStyle? style;

  /// Overrides
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final themeTextStyle =
        style ?? Theme.of(context).textTheme.bodyMedium;

    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 4,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: themeTextStyle?.copyWith(
        color: color ?? themeTextStyle.color ?? AppColors.blackColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
