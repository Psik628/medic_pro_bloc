import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/question_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/subject/question.dart';
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
                stream: currentQuestionSection.questions,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const GFLoader();
                  }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                    return Column(
                      children: [
                        SizedBox(
                          height: 70.h,
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, questionIndex){
                                final Question currentQuestion = snapshot.data[questionIndex];
                                // check if currentQuestion is the question to show
                                return QuestionWidget(currentQuestion: currentQuestion);
                              }
                          ),
                        ),
                      ],
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
