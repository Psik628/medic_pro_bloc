part of 'question_section_bloc.dart';

@freezed
class QuestionSectionEvent with _$QuestionSectionEvent{
  const factory QuestionSectionEvent.manualInitialization({required int questionToDisplayIndex, required List<Question> questions}) = ManualInitialization;
  const factory QuestionSectionEvent.answerQuestion() = AnswerQuestion;
  const factory QuestionSectionEvent.answerFinalQuestion({required Question question}) = AnswerFinalQuestion;
  const factory QuestionSectionEvent.selectOption({required Option.Option option}) = SelectOption;
  const factory QuestionSectionEvent.unSelectOption({required Option.Option option}) = UnSelectOption;
}