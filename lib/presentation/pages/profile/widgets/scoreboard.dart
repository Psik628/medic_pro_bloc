import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/application/services/AnsweredQuestionSectionService.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard_wrapper.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/user/answered_question_section.dart';



class ScoreboardWidget extends StatelessWidget {

  final List<AnsweredQuestionSection> answeredQuestionSections;
  final ScoreboardType scoreboardType;

  const ScoreboardWidget({Key? key, required this.answeredQuestionSections, required this.scoreboardType}) : super(key: key);

  List<AnsweredQuestionSection> _getSpecificAnsweredQuestionSections(List<AnsweredQuestionSection> answeredQuestionSections){
    return AnsweredQuestionSectionService.getSpecificAnsweredQuestionSections(answeredQuestionSections, scoreboardType);
  }

  List<AnsweredQuestionSection> _getCorrectlyAnsweredQuestionSections(List<AnsweredQuestionSection> answeredQuestionSections){
    return AnsweredQuestionSectionService.getCorrectlyAnsweredQuestionSections(answeredQuestionSections, scoreboardType);
  }

  List<int> _getAnsweredQuestionSectionsIndexes(List<AnsweredQuestionSection> answeredQuestionSections){

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
              const Text(
                  "Biologie",
                  // style: TextStyle(
                  //     fontSize: heading == OVERALL_LABEL ? kCardOverallFontSize : kCardFontSize)
              ),
            ],
          ),
          SizedBox(
            // todo make this constant
            // height: heading == OVERALL_LABEL ? 33.h : 8.h,
            child: Column(
              children: [
                Row(
                    children: [
                      const Text(
                          'blabla'
                      ),
                      Spacer(),
                      Text(
                        '${_getSpecificAnsweredQuestionSections(answeredQuestionSections).length}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]
                ),
                Row(
                  children:[
                    const Text(
                      'fdfs',
                    ),
                    const Spacer(),
                    Text(
                      '55',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: PieChart(
                    PieChartData(
                        // centerSpaceRadius: kScoreboardWPieChardR,
                        // startDegreeOffset: kScoreboardWStartDegreeOffset,
                        sections: [
                          PieChartSectionData(
                            value: biologyIndex.toDouble(),
                            color: Colors.green,
                            title: BIOLOGY_LABEL,
                            titleStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                          ),
                          PieChartSectionData(
                            value: chemistryIndex.toDouble(),
                            color: Colors.orange,
                            title: CHEMISTRY_LABEL,
                            titleStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                          ),
                          PieChartSectionData(
                            value: physicsIndex.toDouble(),
                            color: Colors.red,
                            title: PHYSICS_LABEL,
                            titleStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ]
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
