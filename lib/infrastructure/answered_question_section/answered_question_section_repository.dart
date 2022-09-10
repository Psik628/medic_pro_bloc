import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/answered_question_section.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/answered_question_section_failure.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/i_answered_question_section_repository.dart';
import 'package:medic_pro_bloc/domain/answered_question_section/user.dart';

/*
todo rename this thing to user repo, and return user with answered question sections
 */


@LazySingleton(as: IAnsweredQuestionSectionRepository)
class AnsweredQuestionSectionRepository implements IAnsweredQuestionSectionRepository{

  final FirebaseFirestore _firestore;

  AnsweredQuestionSectionRepository(this._firestore);

  @override
  Stream<Either<AnsweredQuestionSectionFailure, List<AnsweredQuestionSection>>> watchAll() async*{

    yield* usersRef
        .snapshots()
        .map((){
          return right(r)
        })
  }
}