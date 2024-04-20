import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_elevated_button.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/view_model/cubit/state.dart';

import '../../../booking/view/screens/booking_screen.dart';
import '../widgets/trip_details/image_slider.dart';
import '../widgets/trip_details/show_activity.dart';
import '../widgets/trip_details/show_detail.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.backGround,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ImageSlider(), //Images
                    SizedBox(height: 10,),
                    ShowDetail(),
                    SizedBox(height: 60,),

                  ],
                ),
              ),
              Align(alignment: AlignmentDirectional.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      backgroundColor: AppColor.foreGround,
                        child: CustomText(text: "Book Now!",color: AppColor.grey,
                        fontSize: 24,fontWeight: FontWeight.bold,),
                        onPressed:(){
                        BookingCubit.get(context).setDestination(
                          HomeCubit.get(context).tripModel!
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(),));
                        }),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
