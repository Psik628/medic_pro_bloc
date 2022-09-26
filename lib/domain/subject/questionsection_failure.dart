import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionsection_failure.freezed.dart';

@freezed
abstract class QuestionSectionFailure with _$QuestionSectionFailure {
  const factory QuestionSectionFailure.unexpected() = _Unexpected;
}