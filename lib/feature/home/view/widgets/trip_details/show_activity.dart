import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/home/view/widgets/trip_details/activities.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';

class ShowActivity extends StatelessWidget {
  const ShowActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      return ActivitiesWidget(activity:
      HomeCubit.get(context).tripModel?.activities?[index]);
    },separatorBuilder: (context, index) {
      return SizedBox(height: 0.01.sh,);
    },
    itemCount: HomeCubit.get(context).tripModel?.activities?.length ?? 0,);
  }
}
