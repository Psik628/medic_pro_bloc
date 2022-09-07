part of 'subject_bloc.dart';

@freezed
class SubjectEvent with _$SubjectEvent{
  const factory SubjectEvent.watchAll() = WatchAllStarted;
  const factory SubjectEvent.subjectsReceived(Either<SubjectFailure, List<Subject>> failureOrSubjects) = SubjectsReceived;
}

// @freezed
// class AuthEvent with _$AuthEvent{
//   const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
//   const factory AuthEvent.signedOut() = SignedOut;
// }

// @freezed
// abstract class NoteWatcherEvent with _$NoteWatcherEvent {
//   const factory NoteWatcherEvent.watchAllStarted() = _WatchAllStarted;
//   const factory NoteWatcherEvent.watchUncompletedStarted() =
//   _WatchUncompletedStarted;
//   const factory NoteWatcherEvent.notesReceived(
//       Either<NoteFailure, KtList<Note>> failureOrNotes,
//       ) = _NotesReceived;
// }