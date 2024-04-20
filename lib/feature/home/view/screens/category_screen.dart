import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/home/view/widgets/category/destination_widget.dart';

import '../../../view_model/cubit/cubit.dart';
import '../../../view_model/cubit/state.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
        builder:(context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
              backgroundColor: AppColor.backGround,
              appBar: AppBar(
                backgroundColor: AppColor.backGround,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.keyboard_backspace_outlined,
                    color: AppColor.foreGround,),
                ),
                centerTitle: true,
                title: CustomText(
                  text:"${cubit.categoryName} Destinations",
                  color: AppColor.foreGround,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              body: ListView.builder(itemBuilder: (context, index) {
                return DestinationWidget(destinationModel:
                cubit.categoryList[index]);
              },
                itemCount: cubit.categoryList.length,
              )

          );
        }
    );
  }
}
