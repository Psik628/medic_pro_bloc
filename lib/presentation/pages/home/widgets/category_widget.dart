import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';

import '../../../../domain/subject/category.dart';
import 'package:sizer/sizer.dart';

class CategoryWidget extends StatelessWidget {
  final Category currentCategory;

  const CategoryWidget({Key? key, required this.currentCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        AutoRouter.of(context).push(CategoryPageRoute(currentCategory: currentCategory));
      } ,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(currentCategory.title).tr(),
            ),
            const Icon(Icons.arrow_right_alt_outlined)
          ],
        ),
      leading: SizedBox(
          height: 15.h,
          width: 15.w,
          // todo extract this
          child: Image.asset('assets/${currentCategory.title}.png')
      ),
    );
  }
}

