part of 'question_section_bloc.dart';

@freezed
class QuestionSectionEvent with _$QuestionSectionEvent{
  const factory QuestionSectionEvent.answerQuestion({required Question question}) = AnswerQuestion;
  const factory QuestionSectionEvent.answerFinalQuestion({required Question question}) = AnswerFinalQuestion;
  const factory QuestionSectionEvent.selectOption({required Question question, required Option option}) = SelectOption;
  const factory QuestionSectionEvent.unSelectOption({required Question question, required Option option}) = UnSelectOption;
}