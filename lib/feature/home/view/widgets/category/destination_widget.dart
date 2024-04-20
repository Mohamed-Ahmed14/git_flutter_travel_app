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
        height: 180,
        width: 320,
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Image.asset(destinationModel.imagesList?[0] ?? "",
              height: 120,fit: BoxFit.fill,
              width:340,),
            Row(
              children: [
                Expanded(child: CustomText(text: destinationModel.name ?? "", color: AppColor.grey)),
                Icon(Icons.location_city_outlined,color: AppColor.yellow,),
                CustomText(text: "${destinationModel.days} days", color: AppColor.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
