import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight fontWeight;

  const CustomText({super.key, required this.text, required this.color,this.fontSize,this.fontWeight=FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height:1.h
    ),);
  }
}
