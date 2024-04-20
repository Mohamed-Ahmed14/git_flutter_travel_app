import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/home/model/destination_model.dart';
import 'package:travel_app/feature/home/view/widgets/category/ancient_scection.dart';
import 'package:travel_app/feature/home/view/widgets/category/modern_section.dart';

import '../widgets/carousel_slider/show_slider.dart';
import '../widgets/category/category_widget.dart';
import '../widgets/category/destination_widget.dart';
import '../widgets/category/special_section.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,

      body:SingleChildScrollView(
        child: Column(
          children: [

            HomeAppBar(),          //AppBar
            SizedBox(height: 20,),
            ShowSlider(),         //Slider
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            AncientSection(),     //Ancient  Destinations
            ModernSection(),     //Modern  Destinations
            SpecialSection(), //Special  Destinations

          ],
        ),
      ),

    );
  }
}
