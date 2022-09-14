import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard_wrapper.dart';

import '../../domain/user/answered_question_section.dart';

class AnsweredQuestionSectionService{

  AnsweredQuestionSectionService._();

  static List<AnsweredQuestionSection> getSpecificAnsweredQuestionSections(List<AnsweredQuestionSection> questionSections, ScoreboardType type){
    if(type == ScoreboardType.overAll){
      return questionSections;
    }else if(type == ScoreboardType.biology){
      return questionSections.where((AnsweredQuestionSection answeredQuestionSection){
        // todo extract this
        return answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/biology/');
      }).toList();
    }else if(type == ScoreboardType.chemistry){
      return questionSections.where((AnsweredQuestionSection answeredQuestionSection){
        // todo extract this
        return answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/chemistry/');
      }).toList();
    }else{
      return questionSections.where((AnsweredQuestionSection answeredQuestionSection){
        // todo extract this
        return answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/physics/');
      }).toList();
    }
  }
}