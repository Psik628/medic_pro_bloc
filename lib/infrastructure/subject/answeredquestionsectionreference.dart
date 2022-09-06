import 'package:json_annotation/json_annotation.dart';

// manual import of generated file
part 'answeredquestionsectionreference.g.dart';

@JsonSerializable(explicitToJson: true)
class AnsweredQuestionSectionReference{

  AnsweredQuestionSectionReference(this.questionsectionreference, this.answeredcorrectly);

  final String questionsectionreference;

  final bool answeredcorrectly;

  factory AnsweredQuestionSectionReference.fromJson(Map<String, Object?> json) => _$AnsweredQuestionSectionReferenceFromJson(json);

  Map<String, Object?> toJson() => _$AnsweredQuestionSectionReferenceToJson(this);
}
