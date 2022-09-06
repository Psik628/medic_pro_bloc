import 'package:dartz/dartz.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';

abstract class ISubjectRepository{
  Stream<Either<SubjectFailure, List<Subject>>> watchAll();
}