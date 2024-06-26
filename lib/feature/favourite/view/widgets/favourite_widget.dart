import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/favourite/view_model/cubit/cubit.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_text.dart';
import '../../../home/model/destination_model.dart';
import '../../../view_model/cubit/cubit.dart';
import '../../view_model/data/firestore_keys.dart';

class FavouriteWidget extends StatelessWidget {
  final QueryDocumentSnapshot favouriteModel;
  const FavouriteWidget({required this.favouriteModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 180.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColor.foreGround),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(favouriteModel[FireStoreKeys.destination_image] ?? "",).image
            )
          ),
        ),

        PositionedDirectional(
          end: 25.w,
          top: 10.h,
          child: Column(
            children: [
              IconButton(
                icon:Icon(Icons.favorite_outlined,
                color:AppColor.foreGround,size: 30.r,),
                onPressed: (){
                   var cubit = FavouriteCubit.get(context);
                  // for(var i in cubit.favouriteList)
                  //   {
                  //     if(i["destination_id"] == destinationModel.id)
                  //       {
                  //         cubit.removeFavourite(i.id);
                  //       }
                  //   }
                   cubit.removeFavourite(favouriteModel.id);
                  cubit.getFavourite();
                },
              ),
              CustomText(text: favouriteModel[FireStoreKeys.destination_name] ?? "",
                color: AppColor.foreGround,
                fontSize: 24.sp,fontWeight: FontWeight.bold,),
            ],
          ),
        )
      ],
    );
  }
}
