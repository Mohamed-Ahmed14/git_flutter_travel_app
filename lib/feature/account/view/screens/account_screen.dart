



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
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.foreGround,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(180, 60)
                              )
                          ),
                          child:cubit.isEditPressed?
                          Align(alignment:AlignmentDirectional.centerStart, child: Row(
                            children: [
                              IconButton(onPressed: (){
                                  cubit.changeFormStatus();
                              }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,)),
                              SizedBox(width: 80,),
                              Text("Update",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35
                              ),),
                            ],
                          )):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(width: 120,),
                              Expanded(
                                child: Text("Profile",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35
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
                                icon:Icon(Icons.login_outlined,color: Colors.white,size: 35,)),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),
                        PositionedDirectional(
                          bottom: -75,
                          start: (MediaQuery.of(context).size.width/2 - 80),
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 5,color: Colors.white),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset("assets/images/logo.jpg",).image,
                                )
                            ),
                            
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 75,),
                            
                    ProfileForm(),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.foreGround,
                          foregroundColor:AppColor.white,
                          fixedSize: Size(320,45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
                        fontSize: 18,
                      ),):
                      Text("Edit Profile",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                    ),
                            
                  ],
                ),
              ),
            ),

        );
      },

    );
  }
}
