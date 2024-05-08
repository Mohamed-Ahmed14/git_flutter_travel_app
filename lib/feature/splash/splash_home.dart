import 'package:flutter/material.dart';
import 'package:travel_app/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:travel_app/feature/home/view/screens/home_screen.dart';
import 'package:travel_app/feature/layout/view/screens/layout_screen.dart';
import 'package:travel_app/feature/splash/splash_screen.dart';

class SplashHomeScreen extends StatelessWidget {
  const SplashHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if(AuthCubit.get(context).getUserCurrentState() == null)
      {
        return SplashScreen();
      }
    else{
      return LayoutScreen();
    }
  }
}
