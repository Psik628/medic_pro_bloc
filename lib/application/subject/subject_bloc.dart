import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/i_subject_repository.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:meta/meta.dart';

part 'subject_event.dart';
part 'subject_state.dart';
part 'subject_bloc.freezed.dart';

@injectable
class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final ISubjectRepository _subjectRepository;

  StreamSubscription<Either<SubjectFailure, List<Subject>>>? _subjectStreamSubscription;

  SubjectBloc(this._subjectRepository) : super(const SubjectState.initial()) {
    on<WatchAllStarted>((WatchAllStarted event, emit) async {
      emit(const SubjectState.loadInProgress());
      await _subjectStreamSubscription?.cancel();
      // listen to repository
      print('preparing to listen to repo');
      _subjectStreamSubscription = _subjectRepository.watchAll().listen(
            (failureOrSubjects) {
              print('failure or succes');
              add(SubjectEvent.subjectsReceived(failureOrSubjects));
            },
      );
    });
    on<SubjectsReceived>((SubjectsReceived event, emit) async {
      event.failureOrSubjects.fold(
          (SubjectFailure failure) => {
            emit(SubjectState.loadFailure(failure))
          },
          (List<Subject> subjects) => {
            emit(SubjectState.loadSuccess(subjects))
          }
      );
    });
  }
}