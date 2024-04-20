import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/layout/view/screens/layout_screen.dart';
import 'package:travel_app/feature/layout/view_model/layout_cubit/layout_cubit.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/custom_elevated_button.dart';
import '../../../../core/custom_text.dart';
import '../../../../core/custom_text_button.dart';
import '../../../../core/custom_text_form_field.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_state.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
    builder: (context, state) {
      var cubit = AuthCubit.get(context);
    return Form(key: cubit.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text:"Email",
              color: AppColor.deepBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "Enter your email",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.email,color: AppColor.backGround),
              controller: cubit.emailController,
              validator: cubit.emailValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            SizedBox(height: 5,),
            CustomText(text:"Password",
              color: AppColor.deepBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600,),
            CustomTextFormField(
              filled: true,
              filledColor: Colors.grey[400]!,
              label: "Enter your password",
              labelColor: AppColor.backGround.withOpacity(0.5),
              prefixIcon: Icon(Icons.lock_rounded,color: AppColor.backGround),
              suffixIcon: IconButton(
                icon: Icon(cubit.obscureText?
                Icons.visibility_off_rounded:Icons.visibility_rounded,
                  color: AppColor.foreGround,),
                onPressed: (){
                  cubit.changeObscure();
                },
              ),
              controller: cubit.passwordController,
              obscureText: cubit.obscureText,
              validator: cubit.passwordValidator,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),

            Align(
              alignment: AlignmentDirectional.topEnd,
              child: CustomTextButton(
                child:CustomText(
                  text: "Forget password?",
                  color: AppColor.grey,
                  fontSize: 14,
                ),
                onPressed:(){
                  print("Forget password");
                  cubit.firebaseResetPassword();
                },
                width: 135,
                height: 20,
                backgroundColor: AppColor.backGround,),
            ),
            SizedBox(height: 5,),
            CustomElevatedButton(
              child:CustomText(
                text: "Login",
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              onPressed:(){
                if(cubit.loginFormKey.currentState!.validate())
                {
                  print("Login pressed");
                  cubit.firebaseLogin().then((value) {
                    LayoutCubit.get(context).current_index=0;
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => LayoutScreen(),),
                    (route) => false,);
                  });

                }
              },
              backgroundColor: AppColor.foreGround,
              height: 45,
              width: 340,
              padding: 2,
            ),
          ],
        ));
    },
    );

  }
}
