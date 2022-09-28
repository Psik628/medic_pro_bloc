part of 'question_section_bloc.dart';

@freezed
class QuestionSectionEvent with _$QuestionSectionEvent{
  const factory QuestionSectionEvent.manualInitialization({required int questionToDisplayIndex, required List<Question> questions}) = ManualInitialization;
  const factory QuestionSectionEvent.answerQuestion() = AnswerQuestion;
  const factory QuestionSectionEvent.answerFinalQuestion() = AnswerFinalQuestion;
  const factory QuestionSectionEvent.resetDisplayResult() = ResetDisplayResult;
  const factory QuestionSectionEvent.setCorrectOptionsLength({required int questionToDisplayIndex ,required int correctOptionsLength}) = SetCorrectOptionsLength;
  const factory QuestionSectionEvent.selectOption({required Option option}) = SelectOption;
  const factory QuestionSectionEvent.unSelectOption({required Option option}) = UnSelectOption;
}