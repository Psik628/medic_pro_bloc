import 'package:json_annotation/json_annotation.dart';

import '../../domain/subject/option.dart';
// import '../../infrastructure/subject/option.dart';

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

  // this field is not pulled from database
  // List<Option> _options = [];
  // this field is not pulled from database and items to this field should be added when user selects option
  List<Option> _selectedOptions = [];

  // List<Option> get options => _options;
  List<Option> get selectedOptions => _selectedOptions;

  // void setOptions(List<Option> options){
  //   _options = options;
  // }

  // todo: should be renamed to addToSelectedOptions, but DOM does not work at the moment
  void addToSelectedQuestions(Option selectedOption){
    print(this.content);
    _selectedOptions.add(selectedOption);
  }

  void removeSpecificOptionFromSelectedOptions(String optionToBeRemovedContent){
    _selectedOptions.retainWhere((option) => option.content != optionToBeRemovedContent);
  }

  factory Question.fromJson(Map<String, Object?> json) => _$QuestionFromJson(json);

  Map<String, Object?> toJson() => _$QuestionToJson(this);
}