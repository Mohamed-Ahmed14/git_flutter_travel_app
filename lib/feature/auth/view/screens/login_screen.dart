import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_elevated_button.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/core/custom_text_button.dart';
import 'package:travel_app/core/custom_text_form_field.dart';
import 'package:travel_app/feature/auth/view/screens/register_screen.dart';
import 'package:travel_app/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:travel_app/feature/layout/view/screens/layout_screen.dart';

import '../../view_model/cubit/auth_state.dart';
import '../widgets/login_form_widget.dart';
import '../widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Padding(
        padding:  EdgeInsets.all(15.w),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.05.sh,),
              LogoWidget(),
              //Login Text
              CustomText(text:"Login",
                color:AppColor.grey,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,),
              SizedBox(height: 0.01.sh,),
              //Login Form
              LoginFormWidget(),
              SizedBox(height: 0.05.sh,),
              //Login with Google
              CustomText(
                  text:"Or login with",
                  color: AppColor.grey),
              SizedBox(height: 0.01.sh,),
              CustomElevatedButton(
                child: Image.network(
                    fit: BoxFit.cover,height: 40.h,width: 150.h,
                    "https://cdn.freebiesupply.com/logos/thumbs/2x/google-1-1-logo.png"),
                onPressed:(){
                  print("Login with google");
                  AuthCubit.get(context).signInWithGoogle().then((value){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => LayoutScreen(),),
                            (route) => false);
                  });
                },
                backgroundColor: AppColor.blueGreyDark,
                width: 340.w,
                height: 45.h,
                padding: 2.w,

              ),
              //Sign Up
              Row(
                children: [
                  CustomText(text:"Don't have an account? ",
                      color: AppColor.grey),
                  CustomTextButton(child:CustomText(
                    text: "Sign Up",
                    color: AppColor.foreGround,
                  ),
                    onPressed:(){
                      print("Sign up");
                      AuthCubit.get(context).reset();
                      Navigator.pushNamedAndRemoveUntil(context, "signUp", (route) => false);
                    },
                    height: 25.h,
                    width: 45.w,
                    padding: 1.w,),
                ],
              ),




            ],
          ),
        ),

      ),
    );
  }
}
