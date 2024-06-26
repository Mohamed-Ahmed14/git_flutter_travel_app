
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/account/view_model/cubit/cubit.dart';

import '../../../../core/colors/colors.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color:AccountCubit.get(context).formColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Form(
          key: AccountCubit.get(context).accountKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.w),
                  labelText: "name",
                  labelStyle: TextStyle(color: AppColor.backGround),
                  alignLabelWithHint: true,
                  enabled: AccountCubit.get(context).isEditPressed,
                  prefixIcon: Icon(Icons.person,color: AppColor.backGround,),
                ),
                style: TextStyle(color: AppColor.foreGround),
                showCursor: AccountCubit.get(context).isEditPressed,
                cursorColor: AppColor.backGround,
                controller: AccountCubit.get(context).nameController,
              ),
              SizedBox(height: 0.02.sh,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.w),
                  labelText: "email",
                  labelStyle: TextStyle(color: AppColor.backGround),
                  alignLabelWithHint: true,
                  // enabled: AccountCubit.get(context).isEditPressed,
                  enabled: false,
                  prefixIcon: Icon(Icons.email_rounded,color: AppColor.backGround),
                ),
                style: TextStyle(color: AppColor.foreGround),
                showCursor: AccountCubit.get(context).isEditPressed,
                cursorColor: AppColor.backGround,
                controller: AccountCubit.get(context).emailController,
              ),
              SizedBox(height: 0.02.sh,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.w),
                  labelText: "phone",
                  labelStyle: TextStyle(color: AppColor.backGround),
                  alignLabelWithHint: true,
                  enabled: AccountCubit.get(context).isEditPressed,
                  prefixIcon: Icon(Icons.phone,color: AppColor.backGround,),
                ),
                style: TextStyle(color: AppColor.foreGround),
                showCursor: AccountCubit.get(context).isEditPressed,
                cursorColor: AppColor.backGround,
                controller: AccountCubit.get(context).phoneController,
              ),
              SizedBox(height: 0.02.sh,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.w),
                  labelText: "city",
                  labelStyle: TextStyle(color: AppColor.backGround),
                  alignLabelWithHint: true,
                  enabled: AccountCubit.get(context).isEditPressed,
                  prefixIcon: Icon(Icons.location_city_outlined,color: AppColor.backGround),
                ),
                style: TextStyle(color: AppColor.foreGround),
                showCursor: AccountCubit.get(context).isEditPressed,
                cursorColor: AppColor.backGround,
                controller: AccountCubit.get(context).cityController,
              ),
              SizedBox(height: 0.02.sh,),
              TextFormField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.w),
                  labelText: "address",
                  labelStyle: TextStyle(color: AppColor.backGround),
                  alignLabelWithHint: true,
                  enabled: AccountCubit.get(context).isEditPressed,
                  prefixIcon: Icon(Icons.location_on_sharp,color: AppColor.backGround),
                ),
                style: TextStyle(color: AppColor.foreGround),
                showCursor: AccountCubit.get(context).isEditPressed,
                cursorColor: AppColor.backGround,
                controller: AccountCubit.get(context).addressController,

              ),
              SizedBox(height: 0.02.sh,),
            ],
          ),
        ),
    );


  }
}
