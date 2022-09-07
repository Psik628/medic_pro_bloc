import 'package:json_annotation/json_annotation.dart';

// manual import of generated file
part 'option.g.dart';

@JsonSerializable(explicitToJson: true)
class Option{

  Option(this.content, this.correct,);

  final String content;

  final bool correct;

  bool _isSelected = false;

  void setSelection(bool selection){
    _isSelected = selection;
  }

  bool get isSelected => _isSelected;

  factory Option.fromJson(Map<String, Object?> json) => _$OptionFromJson(json);

  Map<String, Object?> toJson() => _$OptionToJson(this);
}