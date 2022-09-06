// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answeredquestionsectionreference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnsweredQuestionSectionReference _$AnsweredQuestionSectionReferenceFromJson(
        Map<String, dynamic> json) =>
    AnsweredQuestionSectionReference(
      json['questionsectionreference'] as String,
      json['answeredcorrectly'] as bool,
    );

Map<String, dynamic> _$AnsweredQuestionSectionReferenceToJson(
        AnsweredQuestionSectionReference instance) =>
    <String, dynamic>{
      'questionsectionreference': instance.questionsectionreference,
      'answeredcorrectly': instance.answeredcorrectly,
    };
