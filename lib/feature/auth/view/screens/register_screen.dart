import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/auth/view/screens/login_screen.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_elevated_button.dart';
import '../../../../core/custom_text.dart';
import '../../../../core/custom_text_button.dart';
import '../../../../core/custom_text_form_field.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_state.dart';
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
                  LogoWidget(),
                  //Sign up Text
                  CustomText(text:"Sign Up",
                    color:AppColor.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,),
                  SizedBox(height: 10,),
                  //Sign Up Form
                  RegisterFormWidget(),
                  //Login
                  Row(
                    children: [
                      CustomText(text:"Already have an account? ",
                          color: AppColor.grey),
                      CustomTextButton(child:CustomText(
                        text: "Login",
                        color: AppColor.foreGround,
                      ),
                        onPressed:(){
                          print("Login");
                          AuthCubit.get(context).reset();
                          Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                        },
                        height: 25,
                        width: 80,
                        padding: 1,),
                    ],
                  ),

                ],
              )
          ),
        ),
    );


  }
}
