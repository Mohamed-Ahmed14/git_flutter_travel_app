import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/account/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/account/view_model/cubit/state.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_text.dart';

class HomeAppBar extends StatelessWidget{
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backGround,
      leading: CustomText(text: "",color: AppColor.transparent,),
      leadingWidth: 5.w,
      title:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AccountCubit,AccountState>(
            builder: (context, state) {
              return CustomText(
                  text:"Welcome ${AccountCubit.get(context).nameController.text}" ,
                  color: AppColor.foreGround);
            },
          ),
          CustomText(text: "Where are you going today ?",
              color: AppColor.grey,fontSize: 14.sp,),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage:Image.asset("assets/images/logo.jpg",).image,

        )
      ],

    );
  }
}
