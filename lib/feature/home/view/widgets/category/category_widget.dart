import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/home/model/destination_model.dart';
import 'package:travel_app/feature/home/view/screens/category_screen.dart';
import 'package:travel_app/feature/home/view/widgets/category/destination_widget.dart';

import '../../../../view_model/cubit/cubit.dart';
import '../../../model/category_type.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryType category;
  final String text;
  const CategoryWidget({required this.text,required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    List<DestinationModel> categoryList =
    HomeCubit.get(context).destinationList.
    where((element) => element.category == category).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: SizedBox(
            height: 36.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text:"${text} Destinations", color:AppColor.foreGround,
                fontWeight: FontWeight.w800,fontSize: 16.sp,),
                IconButton(onPressed:(){
                  HomeCubit.get(context).showCategory(category);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
                },
                    icon:Icon(Icons.arrow_forward_rounded,color: AppColor.foreGround,)),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 201.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {

                return DestinationWidget(destinationModel:
                categoryList[index]);
          },
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
