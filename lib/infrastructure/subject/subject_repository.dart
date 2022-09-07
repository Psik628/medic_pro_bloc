import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:medic_pro_bloc/infrastructure/core/firebase_helpers.dart';
import 'package:rxdart/rxdart.dart' as rx_dart;


import '../../domain/subject/i_subject_repository.dart';

@LazySingleton(as: ISubjectRepository)
class SubjectRepository implements ISubjectRepository{

  final FirebaseFirestore _firestore;

  SubjectRepository(this._firestore);

  /// this generator returns plain Subject object
  /// to access its categories we need to call SubcategoryCollectionReference subcategoriesRef = subjectsRef.doc('myDocumentID').subcategories;
  @override
  Stream<Either<SubjectFailure, List<Subject>>> watchAll() async* {

    yield*  _firestore
        .collection('MSubjects')
        //snapshots() returns a stream of QuerySnapshot
        .snapshots()
        //list
        .map((snapshot){
          // to domain
          return right<SubjectFailure, List<Subject>>(
              snapshot.docs.map<Subject>((QueryDocumentSnapshot doc){
                // casting probably wrong
                return Subject.fromJson(doc.data() as Map<String, dynamic>);
            }).toList()
          );
        }).onErrorReturnWith((error, stackTrace) {
            // todo implement onError functionality and null check !
            if (error is FirebaseException && error.message!.contains('PERMISSION_DENIED')) {
                return left(const SubjectFailure.insufficientPermission());
            } else {
            return left(const SubjectFailure.unexpected());
            }
        });
  }
}