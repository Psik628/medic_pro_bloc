import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';

class SubcategoryWidget extends StatelessWidget {

  final Subcategory currentSubcategory;

  const SubcategoryWidget({Key? key, required this.currentSubcategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset('assets/${currentSubcategory.title}.png'),
          ),
          title: Text(currentSubcategory.titleUI),

          onTap: (){
            AutoRouter.of(context).push(SubcategoryPageRoute(currentSubcategory: currentSubcategory));
          },
        )
    );
  }
}
