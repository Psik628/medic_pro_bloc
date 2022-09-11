import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_question_section.g.dart';

@JsonSerializable(explicitToJson: true)
class AnsweredQuestionSection{

  bool answeredCorrectly;
  final String questionSectionReference;

  AnsweredQuestionSection({required this.answeredCorrectly, required this.questionSectionReference});

  factory AnsweredQuestionSection.fromJson(Map<String, Object?> json) => _$AnsweredQuestionSectionFromJson(json);

  Map<String, Object?> toJson() => _$AnsweredQuestionSectionToJson(this);
}