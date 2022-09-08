import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
            vertical: UIConstants.safeAreaPaddingVertical,
            horizontal: UIConstants.safeAreaPaddingHorizontal
        ),
        child: Column(
          children: [
            ListView.builder(
              itemCount: snapshot.data.length, itemBuilder: (BuildContext context, int index) {

              },
                // shrinkWrap: true,
                // itemBuilder: (context, categoryIndex){
                //   final Category currentCategory = snapshot.data[categoryIndex];
                //   return CategoryWidget(currentCategory: currentCategory);
                // }
            );
          ],
        ),
      ),
    );
  }
}
