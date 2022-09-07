import 'package:flutter/material.dart';

import '../../../../domain/subject/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category currentCategory;

  const CategoryWidget({Key? key, required this.currentCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(currentCategory.title),
    );
  }
}
