import 'package:flutter/material.dart';

import 'app_bar_trip_detail.dart';
import 'images_list_view.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagesListView(),
        AppBarTripDetail(),
      ],
    );
  }
}
