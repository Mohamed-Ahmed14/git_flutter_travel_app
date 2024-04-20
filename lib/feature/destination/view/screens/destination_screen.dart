import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/home/view/widgets/category/destination_widget.dart';
import 'package:travel_app/feature/view_model/cubit/state.dart';

import '../../../view_model/cubit/cubit.dart';
import '../widget/search_widget.dart';


class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.backGround,
          body: SafeArea(
            child: Stack(
              //mainAxisSize: MainAxisSize.max,
              alignment: AlignmentDirectional.topCenter,
              children: [
               SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(height: 50,),
                     Visibility(
                       visible: cubit.searchController.text.trim().isEmpty || cubit.searchList.isNotEmpty,
                       replacement: Center(
                           child: CustomText(
                             text:"No Data Found" ,color: AppColor.grey,
                             fontSize: 20,fontWeight: FontWeight.bold,)),
                       child: ListView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder:(context, index) {
                           return DestinationWidget(destinationModel:
                           cubit.searchController.text.trim().isEmpty?
                           cubit.destinationList[index]:cubit.searchList[index]);
                         },
                         itemCount:cubit.searchController.text.trim().isEmpty?
                         cubit.destinationList.length : cubit.searchList.length,
                       ),
                     ),
                   ],
                 ),
               ),
                PositionedDirectional(top: 1,
                  child: SearchWidget(),
                ), //Search
              ],
            ),
          ),
        );
      },
    );
  }
}
