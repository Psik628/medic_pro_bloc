import 'package:json_annotation/json_annotation.dart';

import '../../domain/subject/option.dart';

// manual import of generated file
part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question{

  Question(this.content, this.title);

  final String title;

  final String content;

  // added later
  @JsonKey(ignore: true)
  late final Stream<List<Option>> options;

  List<Option> selectedOptions = [];

  void addToSelectedOptions(Option justSelectedOption){
    selectedOptions.add(justSelectedOption);
  }

  void removeSelectedOption(Option justUnselectedOption){
    selectedOptions.remove(justUnselectedOption);
  }

  factory Question.fromJson(Map<String, Object?> json) => _$QuestionFromJson(json);

  Map<String, Object?> toJson() => _$QuestionToJson(this);
}