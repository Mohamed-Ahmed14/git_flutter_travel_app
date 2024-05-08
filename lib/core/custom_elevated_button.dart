import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? padding;
  final Color borderColor;
  final double? borderRadius;

  const CustomElevatedButton({
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
    return ElevatedButton(
        onPressed: onPressed,
        child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: Size(width??320.w, height??50.h),
        padding: EdgeInsets.all(padding??2.w),
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
