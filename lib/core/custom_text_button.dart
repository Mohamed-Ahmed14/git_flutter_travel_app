import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/colors.dart';

class CustomTextButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? padding;
  final Color borderColor;
  final double? borderRadius;
  const CustomTextButton({
    this.borderRadius,
    this.borderColor = AppColor.transparent,
    this.padding,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed, child: child,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: Size(width??50.w, height??50.h),
        padding: EdgeInsets.all(padding??1.w),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius??10.r),
        ),
      ),
    );
  }
}
