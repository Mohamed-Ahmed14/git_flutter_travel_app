import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/core/custom_text_form_field.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/layout/view/screens/layout_screen.dart';
import 'package:travel_app/feature/layout/view_model/layout_cubit/layout_cubit.dart';

import '../../../../core/custom_elevated_button.dart';
import '../../view_model/cubit/state.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            BookingCubit.get(context).reset();
          },
          icon: Icon(Icons.arrow_back_outlined,color: AppColor.foreGround,),
        ),
        centerTitle: true,
        title: CustomText(text: "Ticket",color: AppColor.foreGround,
        fontSize: 20.sp,fontWeight: FontWeight.w800,),
      ),
      body: BlocBuilder<BookingCubit,BookingState>(
        builder: (context, state) {
          var cubit = BookingCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 320.w,
                    padding: EdgeInsetsDirectional.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Form(
                      key: BookingCubit.get(context).bookingKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              CustomText(text:"Destination: ",
                                color:AppColor.foreGround,fontSize: 20.sp,fontWeight: FontWeight.w800,),
                              CustomText(text:"${BookingCubit.get(context).destinationModel?.name}",
                                color:AppColor.backGround,fontSize: 18.sp,fontWeight: FontWeight.w600,),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(text:"Price: ",
                                color:AppColor.foreGround,fontSize: 20.sp,fontWeight: FontWeight.w800,),
                              CustomText(text:"${BookingCubit.get(context).destinationModel?.price}\$",
                                color:AppColor.backGround,fontSize: 16.sp,fontWeight: FontWeight.w600,),
                            ],
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomTextFormField(
                            label: "Name",
                            prefixIcon: Icon(Icons.person,color: AppColor.foreGround),
                            controller: BookingCubit.get(context).nameController,
                            validator: BookingCubit.get(context).validator,
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomTextFormField(
                            label: "Email",
                            prefixIcon: Icon(Icons.email_rounded,color: AppColor.foreGround,),
                            controller: BookingCubit.get(context).emailController,
                            validator: BookingCubit.get(context).validator,
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomTextFormField(
                            label: "Phone",
                            prefixIcon: Icon(Icons.phone,color: AppColor.foreGround,),
                            controller: BookingCubit.get(context).phoneController,
                            validator: BookingCubit.get(context).validator,
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomTextFormField(
                            label: "City",
                            prefixIcon: Icon(Icons.location_city_rounded,color: AppColor.foreGround,),
                            controller: BookingCubit.get(context).cityController,
                            validator: BookingCubit.get(context).validator,
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomTextFormField(
                            label: "Date",
                            prefixIcon: Icon(Icons.date_range_outlined,color: AppColor.foreGround,),
                            controller: BookingCubit.get(context).dateController,
                            validator: BookingCubit.get(context).validator,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(2016),
                                lastDate: DateTime(2031),
                                initialDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: AppColor.foreGround,
                                        onPrimary: AppColor.backGround,
                                        surface: AppColor.grey,
                                        onSurface: AppColor.backGround,
                                      ),
                                      dialogBackgroundColor:AppColor.orange,
                                    ),
                                    child: child!,
                                  );
                                },
                              ).then((value) {
                                  if(value != null)
                                    cubit.dateController.text = DateFormat('yyyy-MM-dd').format(value);
                                },
                              );
                            },
                      
                          ),
                          SizedBox(height: 0.02.sh,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text:"No.of Tickets: ",
                                color:AppColor.foreGround,fontSize: 14.sp,),
                              Container(
                                height: 25.h,
                                //width: 110.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed:(){
                                        print("Plus 1");
                                        cubit.updateNoOfTickets((cubit.noOfTickets??0)+1);
                      
                                      },
                                          iconSize: 20.r,
                                          padding: EdgeInsets.all(0.5.w),
                                          icon: Icon(Icons.add,color: AppColor.backGround,)),
                                      CustomText(text: "${cubit.noOfTickets??1}", color: AppColor.foreGround),
                                      IconButton(onPressed:(){
                                        if((cubit.noOfTickets ?? 0) > 1)
                                          {
                                            cubit.updateNoOfTickets((cubit.noOfTickets??0)-1);
                                          }
                                      },
                                        iconSize: 20.r,
                                        //padding: EdgeInsets.all(5.w),
                                        highlightColor: Colors.transparent,
                                        icon: Icon(Icons.maximize_rounded,
                                           color: ((cubit.noOfTickets?? 0) > 1)? Colors.black : Colors.grey[700] ,)
                                        ),
                      
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.02.sh,),
                          Row(
                            children: [
                              CustomText(text: "Total Price: ",color: AppColor.foreGround,
                                fontSize: 14.sp,),
                              Expanded(child: CustomText(text: "${cubit.totalPrice}\$",
                                color: AppColor.backGround,fontSize: 14.sp,)),
                              CustomText(text:"Days: ", color: AppColor.foreGround,fontSize: 14.sp,),
                              CustomText(text: "${cubit.destinationModel?.days ?? ""}", color: AppColor.backGround,
                              fontSize: 14.sp,),
                            ],
                          ),
                          SizedBox(height: 0.02.sh,),
                          CustomElevatedButton(
                              backgroundColor: AppColor.foreGround,
                              child: CustomText(text: "Checkout",color: AppColor.grey,
                                fontSize: 20.sp,fontWeight: FontWeight.bold,),
                              onPressed:(){
                                if(cubit.bookingKey.currentState!.validate())
                                  {
                                    cubit.addOrder().then((value){
                                      print("Request Done");
                                      cubit.reset();
                                      LayoutCubit.get(context).current_index=0;
                                      Navigator.pushAndRemoveUntil(context,
                                           MaterialPageRoute(builder: (context) => LayoutScreen(),),
                                              (route) => false);
                                    });
                                  }
                              },
                          width: 320.w,height: 45.h,padding: 0.0005.w,),
                      
                      
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
