// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      json['content'] as String,
      json['correct'] as bool,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'content': instance.content,
      'correct': instance.correct,
    };
