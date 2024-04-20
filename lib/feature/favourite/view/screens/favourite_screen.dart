import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/favourite/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/home/model/destination_model.dart';
import 'package:travel_app/feature/home/view/widgets/category/destination_widget.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

import '../../view_model/cubit/state.dart';
import '../widgets/favourite_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    FavouriteCubit.get(context).getFavourite();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: BlocBuilder<FavouriteCubit,FavouriteState>(
        builder: (context, state) {
          // var homeCubit = HomeCubit.get(context);
           var cubit = FavouriteCubit.get(context);
          // List<DestinationModel> favList = [];
          // for(int i=0;i<favCubit.favouriteList.length;i++)
          //   {
          //     favList.addAll(homeCubit.destinationList.
          //     where((element) => element.id == favCubit.favouriteList[i]["destination_id"]).toList());
          //   }
          return Visibility(
            visible: cubit.favouriteList.isNotEmpty,
              replacement: Center(child: CustomText(
                text: "No Favourite Destinations",color: AppColor.grey,
                fontSize: 20,fontWeight: FontWeight.bold,
              ),),
              child: ListView.separated(itemBuilder: (context, index) {
                return FavouriteWidget(favouriteModel:
                cubit.favouriteList[index]);
              },separatorBuilder: (context, index) {
                return SizedBox(height: 10,);
              },
              itemCount: cubit.favouriteList.length,));
        },
      ),
    );
  }
}
