import 'package:flutter/material.dart';

import '../../../model/category_type.dart';
import 'category_widget.dart';

class SpecialSection extends StatelessWidget {
  const SpecialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
      category:CategoryType.Special,
      text: "Special",
    );
  }
}
