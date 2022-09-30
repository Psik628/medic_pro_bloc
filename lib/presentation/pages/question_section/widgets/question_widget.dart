import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/option_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../application/question_section/question_section_bloc.dart';
import '../../../../domain/subject/option.dart';
import '../../../../logging.dart';
import '../../../../translations_constants.dart';

class QuestionWidget extends StatefulWidget {
  final Question currentQuestion;
  final int index;

  QuestionWidget({Key? key, required this.currentQuestion, required this.index}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final log = logger(QuestionWidget);

  bool displayResult = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 30.h,
                color: Colors.grey,
                child: Card(
                  child: Padding(
                      // todo extract this
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: Text(widget.currentQuestion.content!)
                      )
                  )
                ),
              ),
            )
          ],
        ),
        StreamBuilder(
          stream: widget.currentQuestion.options,
          builder: (BuildContext context, AsyncSnapshot<List<Option>> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const GFLoader();
            }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){
              // setup correct options length
              int correctOptionsLength = snapshot.data!.where((Option option){
                return option.correct;
              }).length;

              // todo fix this seriously
              // adding data here, not correct but works
              context.read<QuestionSectionBloc>().add(SetCorrectOptionsLength(questionToDisplayIndex: widget.index, correctOptionsLength: correctOptionsLength));

              return Column(
                children: [
                  SizedBox(
                    // todo fix this height
                    height: 30.h,
                    child: ListView.builder(
                        // todo solve null
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, optionIndex){
                          // todo solve null
                          final Option currentOption = snapshot.data![optionIndex];
                          return OptionWidget(currentOption: currentOption);
                        }
                    ),
                  ),
                ],
              );
            }
            return const GFLoader();
          }
        ),
        BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
          builder: (context, QuestionSectionState state) {
            log.i("Checking whether to show Answer button");
            // get info about current question
            if(state.questions[state.questionToDisplayIndex].selectedOptions.isNotEmpty){
              // if current question has some selected options, display answer button
              return GFButton(
                  fullWidthButton: true,
                  onPressed: (){
                    setState(() {
                      displayResult = !displayResult;
                    });
                    if(displayResult){
                      log.i('Showing results for current question');
                      // clicking button for the first time
                      log.i('Answering question');
                      context.read<QuestionSectionBloc>().add(QuestionSectionEvent.answerQuestion());
                    }
                    // clicking button for the second time, continue to another question
                    else {
                      log.i('Resetting results display and continuing to next question');
                      context.read<QuestionSectionBloc>().add(QuestionSectionEvent.resetDisplayResult());
                    }
                  },
                  child: const Text(TranslationsConstants.answer).tr()
              );
            }else{
              return const Offstage();
            }
          })
      ],
    );
  }
}
