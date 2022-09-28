import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/results_page_card_widget.dart';
import 'package:sizer/sizer.dart';

class ResultsPageWidget extends StatelessWidget {
  const ResultsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
              child: BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.questions.length,
                      itemBuilder: (context, questionIndex) {
                        return ResultsPageCardWidget(questionIndex: questionIndex);
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
