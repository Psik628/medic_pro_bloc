import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medic_pro_bloc/presentation/files_path.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
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
        child: SizedBox(
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
                                      leading: SizedBox(
                                        // extract this
                                        height: 3.h,
                                        width: 3.h,
                                        child: Image.asset(FilesPath.articleIconFilePath),
                                      ),
                                      title: Text(currentArticle.titleUI),
                                      onTap: (){
                                        AutoRouter.of(context).push(ArticlePageRoute(currentArticle: currentArticle));
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
                                        leading: SizedBox(
                                          height: 3.h,
                                          width: 3.h,
                                          child: Image.asset(FilesPath.questionSectionFilePath),
                                        ),
                                        title: Text(currentQuestionSection.titleUI),
                                        onTap: (){
                                          AutoRouter.of(context).push(QuestionSectionPageRoute(currentQuestionSection: currentQuestionSection));
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
