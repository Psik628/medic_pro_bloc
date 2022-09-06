import 'package:json_annotation/json_annotation.dart';
import 'package:medic_pro/dbentities/question.dart';

// manual import of generated file
part 'questionsection.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionSection{

  QuestionSection(this.title, this.titleUI);

  final String title;

  final String titleUI;

  factory QuestionSection.fromJson(Map<String, Object?> json) => _$QuestionSectionFromJson(json);

  Map<String, Object?> toJson() => _$QuestionSectionToJson(this);
}