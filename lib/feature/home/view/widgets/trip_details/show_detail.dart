import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/home/view/widgets/trip_details/show_activity.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

import '../../../../../core/colors/colors.dart';
import '../../../../../core/custom_text.dart';

class ShowDetail extends StatelessWidget {
  const ShowDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: HomeCubit.get(context).tripModel?.name ?? "",
                    color: AppColor.foreGround,fontWeight: FontWeight.bold,
                    fontSize: 20,),
                  CustomText(text: "Days: ${HomeCubit.get(context).tripModel?.days}",
                      color: AppColor.orange),
                ],
              ),
              CustomText(text:"Price: ${HomeCubit.get(context).tripModel?.price}\$",
                  color: AppColor.orange),
            ],
          ),
          CustomText(text: "About the trip:",
            color: AppColor.foreGround,fontSize: 18,),
          CustomText(text:HomeCubit.get(context).tripModel?.description ?? "",
              color: AppColor.grey),
          SizedBox(height: 10,),
          CustomText(text: "Elevate your vacation by:",
              color: AppColor.grey),
          ShowActivity(),

        ],
      ),
    );
  }
}
