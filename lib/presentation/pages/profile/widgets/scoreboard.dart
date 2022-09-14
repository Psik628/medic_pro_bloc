import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/application/services/AnsweredQuestionSectionService.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard_wrapper.dart';

import '../../../../domain/user/answered_question_section.dart';



class ScoreboardWidget extends StatelessWidget {

  final List<AnsweredQuestionSection> answeredQuestionSections;
  final ScoreboardType scoreboardType;

  const ScoreboardWidget({Key? key, required this.answeredQuestionSections, required this.scoreboardType}) : super(key: key);

  List<AnsweredQuestionSection> calculateQuestionSectionsToShow(List<AnsweredQuestionSection> answeredQuestionSections){
    return AnsweredQuestionSectionService.getSpecificAnsweredQuestionSections(answeredQuestionSections, scoreboardType);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              // todo extract this
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/biology.png'),
                // child: Image.asset('assets/${heading == BIOLOGY_LABEL ? BIOLOGY : heading == CHEMISTRY_LABEL ? CHEMISTRY : heading == PHYSICS_LABEL ? PHYSICS : OVERALL}.png'),
              ),
              Text(
                  "Biologie",
                  // style: TextStyle(
                  //     fontSize: heading == OVERALL_LABEL ? kCardOverallFontSize : kCardFontSize)
              ),
            ],
          )
        ],
      )
    );
  }
}
