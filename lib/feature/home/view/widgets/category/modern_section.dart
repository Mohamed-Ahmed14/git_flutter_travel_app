import 'package:flutter/material.dart';

import '../../../model/category_type.dart';
import 'category_widget.dart';

class ModernSection extends StatelessWidget {
  const ModernSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
      category:CategoryType.Modern,
      text: "Modern",
    );
  }
}
