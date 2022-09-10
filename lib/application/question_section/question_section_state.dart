part of 'question_section_bloc.dart';

@freezed
class QuestionSectionState extends Equatable with _$QuestionSectionState{

  const factory QuestionSectionState({
    required int questionToDisplayIndex,
    required List<Question> questions,
    required List<Question> answeredQuestions
  }) = _QuestionSectionState;

  factory QuestionSectionState.initial() => const QuestionSectionState(
      questionToDisplayIndex: 0,
    questions: <Question>[],
    answeredQuestions: <Question>[]
  );

  // this is required to implement equatable
  const QuestionSectionState._();

  @override
  // TODO: implement props
  List<Object?> get props => [this.questionToDisplayIndex, this.questions, this.answeredQuestions];
}
