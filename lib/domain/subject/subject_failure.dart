import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_failure.freezed.dart';

@freezed
abstract class SubjectFailure with _$SubjectFailure {
  const factory SubjectFailure.unexpected() = _Unexpected;
  const factory SubjectFailure.insufficientPermission() = _InsufficientPermission;
  const factory SubjectFailure.unableToUpdate() = _UnableToUpdate;
}