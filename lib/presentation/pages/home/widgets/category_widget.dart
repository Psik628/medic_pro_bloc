import 'package:flutter/material.dart';

import '../../../../domain/subject/category.dart';
import 'package:sizer/sizer.dart';

class CategoryWidget extends StatelessWidget {
  final Category currentCategory;

  const CategoryWidget({Key? key, required this.currentCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  currentCategory.titleUI,
                ),
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
    // return ListTile(
    //   onTap: (){
    //     // set current subject and subject category to provider
    //     context.read<QuestionSectionProvider>().setCurrentSubject(currentSubject);
    //     context.read<QuestionSectionProvider>().setCurrentSubjectCategory(currentSubjectCategory);
    //     Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => SubjectCategoryScreen()));
    //   },
    //   leading: SizedBox(
    //       height: 15.h,
    //       width: 15.w,
    //       child: Image.asset('assets/${currentSubjectCategory.title}.png')
    //   ),
    //   title: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Flexible(
    //         child: Text(
    //           currentSubjectCategory.titleUI,
    //         ),
    //       ),
    //       Icon(Icons.arrow_right_alt_outlined)
    //     ],
    //   ),
    // );
  }
}

