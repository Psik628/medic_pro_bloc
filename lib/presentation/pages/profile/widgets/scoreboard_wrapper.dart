import 'package:flutter/cupertino.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard.dart';

import '../../../../domain/user/answered_question_section.dart';

enum ScoreboardType{
  overAll, biology, chemistry, physics
}

class ScoreBoardWrapperWidget extends StatelessWidget {

  final List<AnsweredQuestionSection> answeredQuestionSections;

  const ScoreBoardWrapperWidget({Key? key, required this.answeredQuestionSections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScoreboardWidget(answeredQuestionSections: answeredQuestionSections, scoreboardType: ScoreboardType.overAll),
        ScoreboardWidget(answeredQuestionSections: answeredQuestionSections, scoreboardType: ScoreboardType.biology),
        ScoreboardWidget(answeredQuestionSections: answeredQuestionSections, scoreboardType: ScoreboardType.chemistry),
        ScoreboardWidget(answeredQuestionSections: answeredQuestionSections, scoreboardType: ScoreboardType.physics)
      ],
    );
  }
}
