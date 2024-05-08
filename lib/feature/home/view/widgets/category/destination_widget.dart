import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/home/model/destination_model.dart';
import 'package:travel_app/feature/home/view/screens/destination_details_screen.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

import '../../../../../core/colors/colors.dart';
import '../../../../../core/custom_text.dart';

class DestinationWidget extends StatelessWidget {
  final DestinationModel destinationModel;
  const DestinationWidget({required this.destinationModel,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        HomeCubit.get(context).getTripDetails(destinationModel.id ?? 0);
        print(destinationModel.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationDetailsScreen(),));
      },
      child: Container(
        height: 201.h,
        width: 320.w,
        padding: EdgeInsetsDirectional.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            SizedBox(height: 0.001.sh,),
            Image.asset(destinationModel.imagesList?[0] ?? "",
              height: 120.h,fit: BoxFit.fill,
              width:340.w,),
            Row(
              children: [
                Expanded(child: CustomText(text: destinationModel.name ?? "",
                    color: AppColor.grey,fontSize: 14.sp,)),
                Icon(Icons.location_city_outlined,color: AppColor.yellow,),
                CustomText(text: "${destinationModel.days} days",
                    fontSize:14.sp,color: AppColor.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
