import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';

import '../../../../core/custom_text_form_field.dart';
import '../../view_model/cubit/state.dart';
import '../widgets/single_order_form.dart';

class SingleTripDetails extends StatelessWidget {
  const SingleTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined,color: AppColor.foreGround,),
        ),
        centerTitle: true,
        title: CustomText(text: "Trip Details",color: AppColor.foreGround,
        fontSize: 20.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<BookingCubit,BookingState>(
          builder: (context, state) {
            var cubit = BookingCubit.get(context);
            return Column(
              children: [
                Image.asset(cubit.singleOrder?.destination_image ?? "",height: 120.h,
                width:MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                Padding(
                  padding:  EdgeInsets.all(15.0.w),
                  child: Column(
                    children: [
                      SizedBox(height: 0.01.sh,),
                      Row(
                        children: [
                          CustomText(text:"Destination: ",
                            color:AppColor.foreGround,fontSize: 18.sp,fontWeight: FontWeight.w800,),
                          CustomText(text:"${cubit.singleOrder?.destination_name}",
                            color:AppColor.grey,fontSize: 18.sp,fontWeight: FontWeight.w600,),
                        ],
                      ), //Destiantio
                      Row(
                        children: [
                          CustomText(text:"Price: ",
                            color:AppColor.foreGround,fontSize: 16.sp,fontWeight: FontWeight.w800,),
                          Expanded(
                            child: CustomText(text:"${cubit.singleOrder?.destination_price ?? 0}\$",
                              color:AppColor.grey,fontSize: 16.sp,fontWeight: FontWeight.w600,),
                          ),
                          CustomText(text:"Days: ", color: AppColor.foreGround,fontSize: 16.sp,),
                          CustomText(text: "${cubit.singleOrder?.days ?? ""}",
                              fontSize:16.sp,color: AppColor.grey),
                        ],
                      ), //Price
                      SizedBox(height: 0.02.sh,),
                      SingleOrderForm(),
                      SizedBox(height: 0.02.sh,),
                      Row(
                        children: [
                          CustomText(text:"No.of Tickets: ",
                            color:AppColor.foreGround,fontSize: 16.sp,),
                          CustomText(text: "${cubit.singleOrder?.no_tickets??1}",
                              color: AppColor.grey,fontSize: 16.sp,),
                        ],
                      ),
                      SizedBox(height: 0.02.sh,),
                      Row(
                        children: [
                          CustomText(text: "Total Price: ",color: AppColor.foreGround,
                            fontSize: 16.sp,),
                          CustomText(text: "${cubit.singleOrder?.total_price}\$",
                            fontSize: 16.sp,color: AppColor.grey,),

                        ],
                      ),
                    ],
                  ),
                ),


              ],
            );
          },
        ),
      ),
    );
  }
}
