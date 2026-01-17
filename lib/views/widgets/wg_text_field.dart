import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_constants.dart';

class WgTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;

  const WgTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
    );

    final errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
    );

    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          textInputAction: textInputAction,
          readOnly: readOnly,
          onTap: onTap,
          style: GoogleFonts.poppins(fontSize: 14.sp),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, color: Colors.black54),
            suffixIcon: suffixIcon,
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(
              color: AppConstants.primaryBlackColor,
            ),
            hintStyle: GoogleFonts.poppins(fontSize: 14.sp),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),

            border: outlineBorder,
            focusedBorder: outlineBorder,
            enabledBorder: outlineBorder,
            disabledBorder: outlineBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            errorStyle: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.red),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}