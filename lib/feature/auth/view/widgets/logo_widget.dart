import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(child: Container(
              height: 160.h,
              width: 160.w,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(90.r),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    opacity:0.7,
                    image: Image.asset("assets/images/logo.jpg",).image,
                  )
              )
          ),),
          PositionedDirectional(
            bottom: 3.h,
            child: CustomText(text:"TRAVIA",
              color: AppColor.foreGround,
              fontWeight:FontWeight.bold,
              fontSize: 18.sp,),
          ),
        ],
      ),
    );
  }
}
