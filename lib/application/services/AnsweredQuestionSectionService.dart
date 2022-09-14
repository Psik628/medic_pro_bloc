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

  static List<AnsweredQuestionSection> getCorrectlyAnsweredQuestionSections(List<AnsweredQuestionSection> questionSections, ScoreboardType type){
    List<AnsweredQuestionSection> specificAnsweredQuestionSections = getSpecificAnsweredQuestionSections(questionSections, type);
    return specificAnsweredQuestionSections.where((AnsweredQuestionSection answeredQuestionSection){
      return answeredQuestionSection.answeredCorrectly;
    }).toList();
  }

  static List<int> getAnsweredQuestionSectionsIndexes(List<AnsweredQuestionSection> questionSections){
    int biologyIndex = 0;
    int chemistryIndex = 0;
    int physicsIndex = 0;

    questionSections.forEach((AnsweredQuestionSection answeredQuestionSection) {
      if(answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/biology/')) biologyIndex++;
      else if(answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/chemistry/')) chemistryIndex++;
      else if(answeredQuestionSection.questionSectionReference.startsWith('/MSubjects/physics/')) physicsIndex++;
    });

    return [biologyIndex, chemistryIndex, physicsIndex];
  }
}