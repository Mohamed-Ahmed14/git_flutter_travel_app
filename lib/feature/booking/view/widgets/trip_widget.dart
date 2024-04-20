import 'package:flutter/material.dart';
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
        height: 160,
        width:300,
        margin: EdgeInsetsDirectional.all(12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColor.brown),
        ),
        child: Row(
          children: [
            Expanded(child: Image.asset(orderModel.destination_image ??"",
            fit: BoxFit.fill,height: 160)),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text:orderModel.destination_name??"",
                    color: AppColor.brown),
                CustomText(text:orderModel.travel_date??"",
                    color: AppColor.brown),
                CustomText(text:"${orderModel.no_tickets} Tickets",
                    color: AppColor.brown),
                CustomText(text:"${orderModel.total_price}\$",
                    color: AppColor.brown),
              ],
            ),
            SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}
