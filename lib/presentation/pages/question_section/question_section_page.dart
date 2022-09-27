import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';
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
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const GFLoader();
                    } else{
                    if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                      // fill block state with initial data
                      context.read<QuestionSectionBloc>().add(ManualInitialization(questionToDisplayIndex: 0, questions: snapshot.data));
                      // building the UI with data from Bloc, that have been inserted above
                      return BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
                        builder: (context, QuestionSectionState state) {

                          if(!state.quizFinished){
                            return Column(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  child: ListView.builder(
                                      itemCount: state.questions.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, questionIndex) {
                                        final Question currentQuestion = snapshot.data[questionIndex];
                                        if (state.questionToDisplayIndex == questionIndex) {
                                          return QuestionWidget(
                                              currentQuestion: currentQuestion);
                                        }
                                        return const Offstage();
                                      }
                                  ),
                                ),
                              ],
                            );
                          }else{
                            return SizedBox(
                                child: Text('should display final page'),
                            );
                          }
                        },
                      );
                    }
                    }
                    return const GFLoader();
                  }
              )
            ],
          ),
        )
    );
  }
}
