import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

import '../../../../core/colors/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        width: 340.w,
        child: SearchBar(
          backgroundColor: MaterialStatePropertyAll(
            AppColor.grey,
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsetsDirectional.all(2.w),
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)
              )
          ),
          leading: Icon(Icons.search_outlined,color: AppColor.backGround,),
          hintText: "Type your destination",
          controller: HomeCubit.get(context).searchController,
          onChanged: (value){
            HomeCubit.get(context).search(value);
            print(value);
          },
        ),
      ),
    );
  }
}
