import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_elevated_button.dart';
import '../../../../core/custom_text.dart';
import '../../../../core/custom_text_form_field.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_state.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
    builder: (context, state) {
    var cubit = AuthCubit.get(context);
    return Form(
        key: cubit.registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text:"Name",
              color: AppColor.deepBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "ex. Nour",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.person,color: AppColor.backGround,),
              controller: cubit.nameController,
              validator: cubit.nameValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            SizedBox(height: 0.01.sh,),
            CustomText(text:"Email",
              color: AppColor.deepBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "ex. example@gmail.com",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.email,color: AppColor.backGround,),
              controller:  cubit.emailController,
              validator: cubit.emailValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            SizedBox(height: 0.01.sh,),

            CustomText(text:"Password",
              color: AppColor.deepBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "Enter your password",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.lock_rounded,color: AppColor.backGround,),
              suffixIcon: IconButton(
                icon: Icon(cubit.obscureText?
                Icons.visibility_off_rounded:Icons.visibility_rounded,
                  color: AppColor.foreGround,),
                onPressed: (){
                  cubit.changeObscure();
                },
              ),
              obscureText: cubit.obscureText,
              controller: cubit.passwordController,
              validator: cubit.passwordValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            SizedBox(height: 0.01.sh,),
            CustomText(text:"Confirmed Password",
              color: AppColor.deepBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "Enter password confirmation",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.lock_rounded,color: AppColor.backGround,),
              suffixIcon: IconButton(
                icon: Icon(cubit.confObscureText?
                Icons.visibility_off_rounded:Icons.visibility_rounded,
                  color: AppColor.foreGround,),
                onPressed: (){
                  cubit.changeConObscure();
                },
              ),
              controller:  cubit.confirmedPasswordController,
              obscureText: cubit.confObscureText,
              validator: cubit.ConPasswordValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            SizedBox(height: 0.05.sh,),
            Center(
              child: CustomElevatedButton(
                child:CustomText(
                  text: "Sign Up",
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                onPressed:(){
                  if(cubit.registerFormKey.currentState!.validate())
                  {
                    print("Sign up pressed");
                    cubit.obscureText=true;
                    cubit.confObscureText = true;
                    cubit.firebaseSignUp().then((value){
                      Navigator.pushNamedAndRemoveUntil(context,
                          "login", (route) => false);
                    });
                  }

                },
                backgroundColor: AppColor.foreGround,
                height: 45.h,
                width: 360.w,
                padding: 0.0001.w,
              ),
            ),

          ],
        ));
    },
    );

  }
}
