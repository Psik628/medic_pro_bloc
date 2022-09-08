import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:medic_pro_bloc/presentation/pages/category/widgets/subcategory_widget.dart';
import "../../../domain/subject/category.dart" as Entity;

import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.currentCategory}) : super(key: key);

  final Entity.Category currentCategory;

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
            Text(
              currentCategory.title,
              // todo this
              // style: TextStyle(
              //   fontSize: 20
              // ),
            ).tr(),
            StreamBuilder(
                stream: currentCategory.subcategories,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const GFLoader();
                  }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, subcategoryIndex){
                          final Subcategory currentSubcategory = snapshot.data[subcategoryIndex];
                          return SubcategoryWidget(currentSubcategory: currentSubcategory);
                        }
                    );
                  }
                  return const GFLoader();
                }
            )
          ],
        ),
      ),
    );
  }
}
