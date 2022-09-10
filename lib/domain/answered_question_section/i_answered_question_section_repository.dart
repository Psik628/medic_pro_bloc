import 'package:dartz/dartz.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/answered_question_section.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/answered_question_section_failure.dart';

abstract class IAnsweredQuestionSectionRepository{
  Stream<Either<AnsweredQuestionSectionFailure, List<AnsweredQuestionSection>>> watchAll();
}