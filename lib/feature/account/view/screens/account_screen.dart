



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/feature/account/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/account/view_model/cubit/state.dart';
import 'package:travel_app/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:travel_app/feature/layout/view_model/layout_cubit/layout_cubit.dart';

import '../../../auth/view/screens/login_screen.dart';
import '../component/profile_form.dart';



class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AcountScreenState();
}

class _AcountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    // TODO: implement initState
    AccountCubit.get(context).showProfile();
    AccountCubit.get(context).isEditPressed=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,AccountState>(
      builder: (context, state) {
        var cubit = AccountCubit.get(context);
        return Scaffold(
            backgroundColor: AppColor.backGround,
            body: Visibility(
                        visible: state is! ShowProfLoadingState,
                        replacement: Center(child: CircularProgressIndicator(),),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 240.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColor.foreGround,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(180.w, 60.h)
                              )
                          ),
                          child:cubit.isEditPressed?
                          Align(alignment:AlignmentDirectional.centerStart, child: Row(
                            children: [
                              IconButton(onPressed: (){
                                  cubit.changeFormStatus();
                              }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30.r,)),
                              SizedBox(width: 0.1.sw,),
                              Text("Update",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp
                              ),),
                            ],
                          )):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(width: 0.1.sw,),
                              Expanded(
                                child: Text("Profile",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.sp
                                ),),
                              ),
                              IconButton(
                                onPressed: (){
                                  AuthCubit.get(context).firebaseLogout().then((value){
                                    AuthCubit.get(context).reset();
                                    LayoutCubit.get(context).current_index=0;
                                    Navigator.pushNamedAndRemoveUntil(context, "login",(route) => false,);
                                  });
                                },
                                icon:Icon(Icons.login_outlined,color: Colors.white,size: 35.r,)),
                              SizedBox(width: 0.05.sw,),
                            ],
                          ),
                        ),
                        PositionedDirectional(
                          bottom: -60.h,
                          start: 0.3.sw,
                          child: Container(
                            height: 160.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 2.w,color: Colors.white),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset("assets/images/logo.jpg",).image,
                                )
                            ),
                            
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.1.sh,),
                            
                    ProfileForm(),
                    SizedBox(height: 0.01.sh,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.foreGround,
                          foregroundColor:AppColor.white,
                          fixedSize: Size(320.w,45.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          )
                      ),
                      onPressed:(){
                        cubit.changeFormStatus();
                        if(!cubit.isEditPressed)
                          {
                            cubit.updateProfile();
                          }
                      },
                      child:cubit.isEditPressed?
                      Text("Update",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),):
                      Text("Edit Profile",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),),
                    ),
                    SizedBox(height: 0.05.sh,)
                            
                  ],
                ),
              ),
            ),

        );
      },

    );
  }
}
