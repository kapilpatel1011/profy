import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profy/controllers/splash_controller.dart';

import '../../utils/app_constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController splashController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 50.sp,
              color: AppConstants.primaryWhiteColor,
            ),
            SizedBox(height: 5.h),
            Text(
              "Profy",
              style: GoogleFonts.ubuntu(
                color: AppConstants.primaryWhiteColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
