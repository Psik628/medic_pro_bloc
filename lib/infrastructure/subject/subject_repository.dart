import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:medic_pro_bloc/infrastructure/core/firebase_helpers.dart';
import 'package:medic_pro_bloc/infrastructure/subject/subject.dart';

import '../../domain/subject/i_subject_repository.dart';

@LazySingleton(as: ISubjectRepository)
class SubjectRepository implements ISubjectRepository{

  final FirebaseFirestore _firestore;

  SubjectRepository(this._firestore);

  @override
  Stream<Either<SubjectFailure, List<Subject>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    // yield* userDoc.subjectCollection
    //     .snapshots((QuerySnapshot snapshot){
    //       right<SubjectFailure, List<Subject>>(snapshot.docs.map((doc){
    //         Subject.fromJson(doc)
    //       }).toImmut
    //     });

    yield*  userDoc
        .subjectCollection
        .snapshots()
        //list
        .map((snapshot){
          // to domain
          return right<SubjectFailure, List<Subject>>(
              snapshot.docs.map<Subject>((QueryDocumentSnapshot doc){
                // casting probably wrong
                return Subject.fromJson(doc.data() as Map<String, Object?>);
            }).toList()
          );
        });
    // todo implement onError functionality







    //     .onErrorReturnWith((e) {
    //   if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
    //     return left(const NoteFailure.insufficientPermission());
    //   } else {
    //     // log.error(e.toString());
    //     return left(const NoteFailure.unexpected());
    //   }
    // });
  }
}