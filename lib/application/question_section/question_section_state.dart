part of 'question_section_bloc.dart';

@freezed
class QuestionSectionState extends Equatable with _$QuestionSectionState{
  const factory QuestionSectionState({
    required int questionToDisplayIndex,
    required bool quizFinished,
    required bool displayResults,
    required List<Question> questions,
    required List<Question> answeredQuestions
  }) = _QuestionSectionState;

  factory QuestionSectionState.initial() => const QuestionSectionState(
      questionToDisplayIndex: 0,
      quizFinished: false,
      displayResults: false,
      questions: [],
      answeredQuestions: []
  );

  @override
  List<Object?> get props => [questionToDisplayIndex, questions, answeredQuestions, quizFinished, identityHashCode(this)];

  // this is required to implement equatable
  const QuestionSectionState._();
}
