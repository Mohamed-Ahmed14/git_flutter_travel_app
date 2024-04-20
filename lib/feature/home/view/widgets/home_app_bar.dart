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
      leadingWidth: 5,
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
          CustomText(text: "Want to discover a new destination?",
              color: AppColor.grey,fontSize: 15,),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 40,
          backgroundImage:Image.asset("assets/images/logo.jpg",).image,

        )
      ],

    );
  }
}
