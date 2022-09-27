part of 'question_section_bloc.dart';

@freezed
class QuestionSectionState with _$QuestionSectionState{
  const factory QuestionSectionState({
    required int questionToDisplayIndex,
    required List<Question> questions,
    required List<Question> answeredQuestions
  }) = _QuestionSectionState;

  factory QuestionSectionState.initial() => const QuestionSectionState(
      questionToDisplayIndex: 0,
      questions: [],
      answeredQuestions: []
  );

  // // this is required to implement equatable
  // const QuestionSectionState._();
}
