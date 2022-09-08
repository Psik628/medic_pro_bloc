import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';

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
        child: Column(
          children: [
            StreamBuilder(
                stream: currentSubcategory.articles,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const GFLoader();
                  }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, categoryIndex){
                          final Article currentArticle = snapshot.data[categoryIndex];
                          return Text(currentArticle.title);
                        }
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

                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, categoryIndex){
                          final QuestionSection currentQuestionSection = snapshot.data[categoryIndex];
                          return Text(currentQuestionSection.title);
                        }
                    );
                  }
                  return const GFLoader();
                }
            ),
          ],
        )
      )
    );
  }
}
