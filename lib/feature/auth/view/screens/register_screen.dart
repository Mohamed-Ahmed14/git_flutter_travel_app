import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/colors/colors.dart';

import '../../../../core/custom_text.dart';
import '../../../../core/custom_text_button.dart';

import '../../view_model/cubit/auth_cubit.dart';

import '../widgets/logo_widget.dart';
import '../widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Padding(
        padding:  EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.05.sh,),
                  LogoWidget(),
                  //Sign up Text
                  CustomText(text:"Sign Up",
                    color:AppColor.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,),
                  SizedBox(height: 0.01.sh,),
                  //Sign Up Form
                  RegisterFormWidget(),
                  SizedBox(height: 0.01.sh,),
                  //Login
                  Row(
                    children: [
                      CustomText(text:"Already have an account? ",
                          color: AppColor.grey,
                      fontSize: 14.sp,),
                      CustomTextButton(child:CustomText(
                        text: "Login",
                        color: AppColor.foreGround,
                        fontSize: 14.sp,
                      ),
                        onPressed:(){
                          print("Login");
                          AuthCubit.get(context).reset();
                          Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                        },
                        height: 25.h,
                        width: 45.w,
                        padding: 1.w,),
                    ],
                  ),

                ],
              )
          ),
        ),
    );


  }
}
