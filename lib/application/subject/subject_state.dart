part of 'subject_bloc.dart';

@freezed
class SubjectState with _$SubjectState{
  const factory SubjectState.initial() = Initial;
  const factory SubjectState.loadInProgress() = LoadInProgress;
  const factory SubjectState.loadSuccess(List<Subject> notes) = LoadSuccess;
  const factory SubjectState.loadFailure(SubjectFailure subjectFailure) =LoadFailure;
}
