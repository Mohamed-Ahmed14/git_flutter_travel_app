
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../model/slider_model.dart';
import 'carousel_slider_item.dart';



class ShowSlider extends StatelessWidget {
  const ShowSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: sliderList.map((e) => CarouselSliderItem(sliderModel: e,)).toList(),
        options: CarouselOptions(height: 90,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.9
        ));


  }
}
