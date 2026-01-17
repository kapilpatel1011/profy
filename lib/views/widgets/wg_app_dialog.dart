import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profy/views/widgets/wg_button.dart';

class WgAppDialog {
  static void showSuccess({
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onConfirm,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30.r,
                child: Icon(Icons.check_circle_rounded, color: Colors.green, size: 45.sp),
              ),
              SizedBox(height: 16.h),

              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),

              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              ),
              SizedBox(height: 24.h),
              WgButton(
                onTap: onConfirm,
                text: buttonText,
                borderRadius: 8,
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Dismiss",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}