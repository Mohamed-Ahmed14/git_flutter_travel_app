import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;
  final double padding;
  final Color borderColor;
  final double borderRadius;

  const CustomElevatedButton({
    this.borderRadius = 10,
    this.borderColor = AppColor.transparent,
    this.padding = 10,
    this.width = 320,
    this.height = 50,
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
        fixedSize: Size(width, height),
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
