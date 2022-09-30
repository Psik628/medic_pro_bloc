import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/subject/option.dart';

// manual import of generated file
part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question extends Equatable{

  Question(this.content, this.title);

  final String? title;

  final String? content;

  int correctOptionsLength = 0;

  // this method does not have length in mind
  bool answeredCorrectly() {
    for (var option in selectedOptions) {
      // if any of the selected options is incorrect, return false
      if(!option.correct) return false;
    }
    return true;
  }

  // added later
  @JsonKey(ignore: true)
  late final Stream<List<Option>> options;

  @JsonKey(ignore: true)
  List<Option> selectedOptions = [];

  void addToSelectedOptions(Option justSelectedOption){
    selectedOptions.add(justSelectedOption);
  }

  void removeSelectedOption(Option justUnselectedOption){
    selectedOptions.remove(justUnselectedOption);
  }

  factory Question.fromJson(Map<String, Object?> json) => _$QuestionFromJson(json);

  Map<String, Object?> toJson() => _$QuestionToJson(this);

  // trying to solve issue of state not updating due to being the same
  @override
  List<Object?> get props => [title, content, selectedOptions.length];
}