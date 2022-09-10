import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_question_section_failure.freezed.dart';

@freezed
abstract class AnsweredQuestionSectionFailure with _$AnsweredQuestionSectionFailure {
  const factory AnsweredQuestionSectionFailure.unexpected() = _Unexpected;
  const factory AnsweredQuestionSectionFailure.insufficientPermission() = _InsufficientPermission;
}