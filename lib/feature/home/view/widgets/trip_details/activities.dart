import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';

class ActivitiesWidget extends StatelessWidget {
  final String? activity;
  const ActivitiesWidget({required this.activity,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check,color: AppColor.green,size: 30.w,),
        SizedBox(width: 0.01.sw,),
        Expanded(child: CustomText(text:activity ?? "", color: AppColor.grey,
        fontSize: 16.sp,)),
      ],
    );
  }
}
