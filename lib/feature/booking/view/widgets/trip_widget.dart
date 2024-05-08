import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/booking/model/order_model.dart';
import 'package:travel_app/feature/booking/view/screens/single_trip_details.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';

class TripWidget extends StatelessWidget {
  final OrderModel orderModel;
  final int index;
  const TripWidget({required this.index,required this.orderModel,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        BookingCubit.get(context).getSingleTrip(index);
        Navigator.push(context, MaterialPageRoute(builder: (context) => SingleTripDetails(),));
      },
      child: Container(
        height: 160.h,
        width:300.w,
        margin: EdgeInsetsDirectional.all(12.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColor.brown),
        ),
        child: Row(
          children: [
            Expanded(child: Image.asset(orderModel.destination_image ??"",
            fit: BoxFit.fill,height: 160.h)),
            SizedBox(width: 0.01.sw,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text:orderModel.destination_name??"",
                    color: AppColor.brown,fontSize: 14.sp,),
                CustomText(text:orderModel.travel_date??"",
                    color: AppColor.brown,fontSize: 14.sp),
                CustomText(text:"${orderModel.no_tickets} Tickets",
                    color: AppColor.brown,fontSize: 14.sp),
                CustomText(text:"${orderModel.total_price}\$",
                    color: AppColor.brown,fontSize: 14.sp),
              ],
            ),
            SizedBox(width: 0.01.sw,),
          ],
        ),
      ),
    );
  }
}
