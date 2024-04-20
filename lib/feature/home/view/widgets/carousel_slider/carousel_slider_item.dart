import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/core/custom_text.dart';
import 'package:travel_app/feature/home/model/slider_model.dart';


class CarouselSliderItem extends StatelessWidget {
  final SliderModel? sliderModel;
  const CarouselSliderItem({super.key, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
      Container(
      width: 320,
      foregroundDecoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.2),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: Image.asset(sliderModel?.imagePath ?? "",).image,
        ),
      ),
    ),
        CustomText(text:sliderModel?.type ?? "", color:
        AppColor.orange,
        fontWeight: FontWeight.bold,
        fontSize: 24,),
      ],
    );
  }
}
