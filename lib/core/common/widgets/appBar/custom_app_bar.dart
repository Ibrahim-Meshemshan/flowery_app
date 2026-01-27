import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.centerTitle,
    required this.titleText,
    this.titleStyle,
    this.iconColor
  });

  final Color? backgroundColor, iconColor;
  final bool? centerTitle;
  final String titleText;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      centerTitle: centerTitle ?? false,
      iconTheme: IconThemeData(color: iconColor ?? AppColors.whiteColor),
      title: Text(
        titleText,
        style:
            titleStyle ??
            TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
