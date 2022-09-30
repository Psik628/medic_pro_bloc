import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/results_page_card_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/subject/question.dart';

class ResultsPageWidget extends StatelessWidget {
  const ResultsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GFCard(
              boxFit: BoxFit.cover,
              title: GFListTile(
                title: Center(
                    child: Text('Results')
                ),
                margin: EdgeInsets.zero,
              ),
              content: BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
                builder: (context, state) {

                  // defining
                  int correctlyAnsweredQuestionsLength = state.questions.where((Question question) {
                    return question.correctOptionsLength == question.selectedOptions.length && question.answeredCorrectly();
                  }).length;

                  int incorrectlyAnsweredQuestionsLength = state.questions.where((Question question) {
                    return question.correctOptionsLength != question.selectedOptions.length || !question.answeredCorrectly();
                  }).length;

                  double successRate = (correctlyAnsweredQuestionsLength/state.questions.length)*100;

                  String successRateString = successRate.toString().substring(0, 2) + "%";

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Correct"),
                              Text(correctlyAnsweredQuestionsLength.toString())
                            ],
                          ),
                          Column(
                            children: [
                              Text("Incorrect"),
                              Text(incorrectlyAnsweredQuestionsLength.toString())
                            ],
                          )
                        ],
                      ),
                      Text(successRateString)
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 80.h,
              child: BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.questions.length,
                      itemBuilder: (context, questionIndex) {
                        return ResultsPageCardWidget(
                            questionIndex: questionIndex);
                      }
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
