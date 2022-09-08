import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/subject/article.dart';
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
        child: Container(
          // todo fix ui
          height: 50.h,
          child: Column(
            children: [
              Text(currentSubcategory.title).tr(),
              StreamBuilder(
                  stream: currentSubcategory.articles,
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const GFLoader();
                    }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                      return Card(
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, categoryIndex){
                              final Article currentArticle = snapshot.data[categoryIndex];
                                return Card(
                                    child: ListTile(
                                      // leading: SizedBox(
                                      //   height: 20,
                                      //   width: 20,
                                      //   child: Image.asset('assets/${subjectSubcategory.title}.png'),
                                      // ),
                                      title: Text(currentArticle.titleUI),
  
                                      onTap: (){
                                        // // on widget tap set the current subject subcategory to provider
                                        // context.read<QuestionSectionProvider>().setCurrentSubjectSubcategory(subjectSubcategory);
                                        //
                                        // Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => const SubjectSubcategoryScreen()));
                                      },
                                    )
                                );
                              }
                            )
                          ],
                        )
                      );
                    }
                    return const GFLoader();
                  }
              ),
              const Spacer(),
              StreamBuilder(
                  stream: currentSubcategory.questionSections,
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const GFLoader();
                    }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                      return Card(
                        child: Column(
                          children: [
                            ListView.builder(
                                itemCount: snapshot.data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, categoryIndex){
                                  final QuestionSection currentQuestionSection = snapshot.data[categoryIndex];
                                  return Card(
                                      child: ListTile(
                                        // leading: SizedBox(
                                        //   height: 20,
                                        //   width: 20,
                                        //   child: Image.asset('assets/${subjectSubcategory.title}.png'),
                                        // ),
                                        title: Text(currentQuestionSection.titleUI),

                                        onTap: (){
                                          // // on widget tap set the current subject subcategory to provider
                                          // context.read<QuestionSectionProvider>().setCurrentSubjectSubcategory(subjectSubcategory);
                                          //
                                          // Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => const SubjectSubcategoryScreen()));
                                        },
                                      )
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    }
                    return const GFLoader();
                  }
              ),
            ],
          ),
        )
      )
    );
  }
}
