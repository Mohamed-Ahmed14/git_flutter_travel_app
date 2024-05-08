import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/booking/view/widgets/trip_widget.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';

import '../../view_model/cubit/state.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BookingCubit.get(context).getOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: BlocBuilder<BookingCubit,BookingState>(
        builder: (context, state) {
          var cubit = BookingCubit.get(context);
          return Visibility(
            visible: cubit.ordersList.isNotEmpty,
            replacement: Center(child: CustomText(
              text: "No Trips",color: AppColor.grey,
              fontSize: 20.sp,fontWeight: FontWeight.bold,
            ),),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 0.01.sh,),
                    CustomText(text:"Your Trips",
                      color: AppColor.foreGround,fontSize: 20.sp,
                      fontWeight: FontWeight.bold,),
                    SizedBox(height: 0.05.sh,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      return TripWidget(orderModel:cubit.ordersList[index],
                      index: index,);
                    },itemCount: cubit.ordersList.length,
                    )
                          
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
