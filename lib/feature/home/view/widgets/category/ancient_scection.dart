import 'package:flutter/material.dart';
import 'package:travel_app/feature/home/view/widgets/category/category_widget.dart';

import '../../../model/category_type.dart';

class AncientSection extends StatelessWidget {
  const AncientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
         category: CategoryType.Ancient,
          text: "Ancient",
    );
  }
}
