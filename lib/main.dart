

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/feature/account/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/auth/view/screens/login_screen.dart';
import 'package:travel_app/feature/auth/view/screens/register_screen.dart';
import 'package:travel_app/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:travel_app/feature/layout/view/screens/layout_screen.dart';
import 'package:travel_app/feature/layout/view_model/layout_cubit/layout_cubit.dart';

import 'feature/auth/view_model/data/local/shared_helper.dart';
import 'feature/booking/view_model/cubit/cubit.dart';
import 'feature/favourite/view_model/cubit/cubit.dart';
import 'feature/home/view/screens/destination_details_screen.dart';
import 'feature/splash/splash_screen.dart';
import 'feature/view_model/cubit/cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit(),),
      BlocProvider(create: (context) => HomeCubit(),),
      BlocProvider(create: (context) => LayoutCubit(),),
      BlocProvider(create: (context) => FavouriteCubit(),),
      BlocProvider(create: (context) => AccountCubit(),),
      BlocProvider(create: (context) => BookingCubit(),),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "signUp":(context) => RegisterScreen(),
        "login":(context) => LoginScreen(),
      },
    )
  ));
}