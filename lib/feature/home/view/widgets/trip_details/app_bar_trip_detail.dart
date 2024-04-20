import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/feature/favourite/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/favourite/view_model/cubit/state.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

class AppBarTripDetail extends StatelessWidget {
  const AppBarTripDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.grey,
              ),
              child: Icon(Icons.arrow_back_outlined,
                color: AppColor.white,
                size: 25,),
            ),
          ),
          BlocBuilder<FavouriteCubit,FavouriteState>(
            builder: (context, state) {
              var cubit = FavouriteCubit.get(context);
              return InkWell(
                onTap: (){
                  var homeCubit = HomeCubit.get(context);
                  if(cubit.isFaouriteItem(homeCubit.tripModel?.id ?? 0))
                  {
                    for(var i in cubit.favouriteList)
                    {
                      if(i["destination_id"] == homeCubit.tripModel?.id)
                      {
                        cubit.removeFavourite(i.id);
                      }
                    }
                  }else{
                    cubit.addToFavourite(homeCubit.tripModel!);

                  }
                  cubit.getFavourite();
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.grey,
                  ),
                  child: Icon(
                    cubit.isFaouriteItem(
                        HomeCubit.get(context).tripModel?.id ?? 0)?
                    Icons.favorite_outlined:Icons.favorite_border_outlined,
                    color:cubit.isFaouriteItem(
                        HomeCubit.get(context).tripModel!.id!)?
                    AppColor.foreGround:AppColor.white,
                  ),

                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
