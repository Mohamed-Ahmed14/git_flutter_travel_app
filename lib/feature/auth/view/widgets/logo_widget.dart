import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity:0.7,
                  image: Image.asset("assets/images/logo.jpg",).image,
                )
            )
        ),),
        PositionedDirectional(
          bottom: 5,
          child: CustomText(text:"TRAVIA",
            color: AppColor.foreGround,
            fontWeight:FontWeight.bold,
            fontSize: 24,),
        ),
      ],
    );
  }
}
