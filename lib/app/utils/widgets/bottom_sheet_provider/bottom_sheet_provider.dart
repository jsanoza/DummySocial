import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial/app/themes/app_text_theme.dart';

import '../../../themes/app_colors.dart';
import '../app_button/base_button.dart';
import '../app_divider/app_divider.dart';

class BottomSheetProvider {
  static showBottomSheetWithHeader({
    required Widget content,
    required String title,
    required double? maxHeight,
    required EdgeInsets padding,
    required VoidCallback callback,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          height: maxHeight ?? 357,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: title == null
                        ? SizedBox()
                        : Center(
                            child: Text(
                              title,
                              style: AppTextStyles.base.blackColor,
                            ),
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: BaseButton(
                        child: Icon(
                          Icons.clear,
                          color: AppColors.lightGray,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (title != null) ...[
                SizedBox(height: 13),
                AppDivider(
                  color: AppColors.colorDivider,
                )
              ],
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: padding,
                  child: content,
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(callback);
  }
}
