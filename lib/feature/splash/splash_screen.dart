import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/core/custom_text.dart';

import '../auth/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late final Future<LottieComposition> _composition;


  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 10),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
    },);
    super.initState();
    _composition = NetworkLottie("https://lottie.host/14844d63-0f8c-4bc3-9ced-9cfb97e4ce7e/WFzT2uXevK.json",).load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.network("https://lottie.host/14844d63-0f8c-4bc3-9ced-9cfb97e4ce7e/WFzT2uXevK.json",),
          SizedBox(
            height:0.4.sh,
            child: FutureBuilder<LottieComposition>(
            future: _composition,
            builder: (context, snapshot) {
              var composition = snapshot.data;
              if (composition != null) {
                return Lottie(composition: composition);
              }
              return SizedBox(height: 1,);
            },
                    ),
          ),
            SizedBox(height: 0.1.sh,),
            CustomText(text: "TRAVIA", color: Colors.indigo[800]!,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,),
            CustomText(text: "The Ultra Way To Discover The World", color: Colors.grey)
          ],
        ),
      ),
    );
  }

}


