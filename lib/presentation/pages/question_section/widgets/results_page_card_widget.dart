import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';

import '../../../../domain/subject/option.dart';
import '../../../../domain/subject/question.dart';

class ResultsPageCardWidget extends StatefulWidget {
  const ResultsPageCardWidget({Key? key, required this.questionIndex}) : super(key: key);

  final int questionIndex;

  @override
  State<ResultsPageCardWidget> createState() => _ResultsPageCardWidgetState();
}

class _ResultsPageCardWidgetState extends State<ResultsPageCardWidget> {

  late final int correctOptionsLength;

  List<Question> answeredCorrectlyQuestions = [];

  // int evaluator(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: state.questions[widget.questionIndex].options,
          builder: (BuildContext context, AsyncSnapshot<List<Option>> snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const GFLoader(type: GFLoaderType.square);
            }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              // // notify
              // context.read<QuestionSectionBloc>().add(QuestionSectionEvent.setCorrectOptionsLength(questionToDisplayIndex: widget.questionIndex,correctOptionsLength: snapshot.data!.length));

              // print(state.questions[widget.questionIndex].content);
              //
              // int correctOptionsLength = snapshot.data!.where((option) => option.correct).length;

              // // all options that were chosen are correct and all correct options were chosen
              // if(state.questions[widget.questionIndex].answeredCorrectly() && state.questions[widget.questionIndex].selectedOptions.length == correctOptionsLength){
              //   setState(() {
              //     answeredCorrectlyQuestions: [...answeredCorrectlyQuestions.add(state.questions[widget.questionIndex])];
              //   });
              //   print('Correctly answered questions length');
              //   print(answeredCorrectlyQuestions.length);
              // }

              return GFCard(
                    // color: state.questions[widget.questionIndex].answeredCorrectly() == true && state.questions[widget.questionIndex].correctQuestionsLength == state.questions[widget.questionIndex].selectedOptions.length ? GFColors.SUCCESS : GFColors.DANGER,
                    content: Text(state.questions[widget.questionIndex].content!),
                    buttonBar: GFButtonBar(
                      children: [
                        ListView.builder(
                        itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            // making the options list view not scrollable
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, optionIndex) {
                              return GFButton(
                                onPressed: () {},
                                color: snapshot.data![optionIndex].correct ? GFColors.SUCCESS : GFColors.DANGER,
                                // checking if the current option is in QuestionSectionState selectedOptions field
                                shape: state.questions[widget.questionIndex].selectedOptions.contains(snapshot.data![optionIndex]) ? GFButtonShape.pills : GFButtonShape.square,
                                text: snapshot.data![optionIndex].content,
                              );
                            }
                        )
                      ]
                  )
              );
            } else{
              return const GFLoader(type: GFLoaderType.ios);
            }
          }
        );
      },
    );
  }
}
