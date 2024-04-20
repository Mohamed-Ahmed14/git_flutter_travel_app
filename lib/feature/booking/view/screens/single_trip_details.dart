import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        fontSize: 20,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<BookingCubit,BookingState>(
          builder: (context, state) {
            var cubit = BookingCubit.get(context);
            return Column(
              children: [
                Image.asset(cubit.singleOrder?.destination_image ?? "",height: 120,
                width:double.infinity,fit: BoxFit.fill,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          CustomText(text:"Destination: ",
                            color:AppColor.foreGround,fontSize: 18,fontWeight: FontWeight.w800,),
                          CustomText(text:"${cubit.singleOrder?.destination_name}",
                            color:AppColor.grey,fontSize: 18,fontWeight: FontWeight.w600,),
                        ],
                      ), //Destiantio
                      Row(
                        children: [
                          CustomText(text:"Price: ",
                            color:AppColor.foreGround,fontSize: 16,fontWeight: FontWeight.w800,),
                          Expanded(
                            child: CustomText(text:"${cubit.singleOrder?.destination_price ?? 0}\$",
                              color:AppColor.grey,fontSize: 16,fontWeight: FontWeight.w600,),
                          ),
                          CustomText(text:"Days: ", color: AppColor.foreGround),
                          CustomText(text: "${cubit.singleOrder?.days ?? ""}", color: AppColor.grey),
                        ],
                      ), //Price
                      SizedBox(height: 8,),
                      SingleOrderForm(),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          CustomText(text:"No.of Tickets: ",
                            color:AppColor.foreGround,),
                          CustomText(text: "${cubit.singleOrder?.no_tickets??1}", color: AppColor.grey),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(text: "Total Price: ",color: AppColor.foreGround,
                            fontSize: 18,),
                          CustomText(text: "${cubit.singleOrder?.total_price}\$",color: AppColor.grey,),

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
