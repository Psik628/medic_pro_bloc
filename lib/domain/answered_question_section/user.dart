// manual import of generated file
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../subject/answeredquestionsectionreference.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User{

  User(this.email, this.nickname);

  final String email;
  final String nickname;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  Map<String, Object?> toJson() => _$UserToJson(this);
}

@Collection<User>('Users')
@Collection<AnsweredQuestionSectionReference>('Users/*/answeredquestionsections')
final usersRef = UserCollectionReference();