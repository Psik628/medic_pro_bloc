import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
    );
  }
}
