import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../functions/navigator/navigator_services.dart';
import '../sized_box/gap_sized.dart';

enum SnackType { success, error }

class AppUtils {
  AppUtils._();

  /// Generic SnackBar
  static void snackBar({
    required BuildContext context,
    required String message,
    required SnackType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.whiteColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: type == SnackType.success
                ? AppColors.primaryColor
                : AppColors.redColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            Icon(
              type == SnackType.success
                  ? Icons.check_circle_outline
                  : Icons.error ,
              color: type == SnackType.success
                  ? AppColors.primaryColor
                  : AppColors.redColor,
            ),
            gapW4,
            Text(
              message,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Generic Dialog
  static Future<void> dialog({
    required BuildContext context,
    required String message,
    String? title,
    bool isLoading = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: !isLoading,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: isLoading ? null : Text(title ?? ''),
          content: Row(
            children: [
              if (isLoading)
                const CircularProgressIndicator(color: AppColors.primaryColor,)
              else
                const SizedBox.shrink(),
              if (isLoading) gapW8,
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          actions: isLoading
              ? null
              : [
            TextButton(
              onPressed: () {
                NavigatorService.pop();
              },
              child: Text(
                'done'.tr(context),
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

