import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';

import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class SubcategoryPage extends StatelessWidget {

  final Subcategory currentSubcategory;

  const SubcategoryPage({Key? key, required this.currentSubcategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          vertical: UIConstants.safeAreaPaddingVertical,
          horizontal: UIConstants.safeAreaPaddingHorizontal
        ),
        child: const Text('page')
      )
    );
  }
}
