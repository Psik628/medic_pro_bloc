import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';

import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class QuestionSectionPage extends StatelessWidget {

  final QuestionSection currentQuestionSection;

  const QuestionSectionPage({Key? key, required this.currentQuestionSection}) : super(key: key);

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
            Center(
                child: Text(currentQuestionSection.title).tr()
            ),
            StreamBuilder(
                stream: currentQuestionSection.questionSections,
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
    );
  }
}
