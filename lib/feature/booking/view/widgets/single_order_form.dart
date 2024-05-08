import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/booking/view_model/cubit/cubit.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_text_form_field.dart';

class SingleOrderForm extends StatelessWidget {
  const SingleOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: "Name",
          prefixIcon: Icon(Icons.person,color: AppColor.foreGround),
          hint: BookingCubit.get(context).singleOrder?.user_name,
          hintColor: AppColor.grey,
          borderColor: AppColor.grey,
          readOnly: true,
          showCursor: false,
        ),
        SizedBox(height: 0.02.sh,),
        CustomTextFormField(
          label: "Email",
          prefixIcon: Icon(Icons.email_rounded,color: AppColor.foreGround,),
          hint: BookingCubit.get(context).singleOrder?.user_email,
          hintColor: AppColor.grey,
          borderColor: AppColor.grey,
          readOnly: true,
          showCursor: false,
        ),
        SizedBox(height: 0.02.sh,),
        CustomTextFormField(
          label: "Phone",
          prefixIcon: Icon(Icons.phone,color: AppColor.foreGround,),
          hint: BookingCubit.get(context).singleOrder?.user_phone,
          hintColor: AppColor.grey,
          borderColor: AppColor.grey,
          readOnly: true,
          showCursor: false,
        ),
        SizedBox(height: 0.02.sh,),
        CustomTextFormField(
          label: "City",
          prefixIcon: Icon(Icons.location_city_rounded,color: AppColor.foreGround,),
          hint: BookingCubit.get(context).singleOrder?.user_city,
          hintColor: AppColor.grey,
          borderColor: AppColor.grey,
          readOnly: true,
          showCursor: false,
        ),
        SizedBox(height: 0.02.sh,),
        CustomTextFormField(
          label: "Date",
          prefixIcon: Icon(Icons.date_range_outlined,color: AppColor.foreGround,),
          hint: BookingCubit.get(context).singleOrder?.travel_date,
          hintColor: AppColor.grey,
          borderColor: AppColor.grey,
          readOnly: true,
          showCursor: false,

        ),
      ],
    );
  }
}
