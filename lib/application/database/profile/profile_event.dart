part of 'profile_bloc.dart';


@freezed
class ProfileEvent with _$ProfileEvent{
  const factory ProfileEvent.watchProfile() = WatchAllStarted;
  const factory ProfileEvent.profileDataReceived(Either<UserFailure, List<User>> failureOrUser) = SubjectsReceived;
}
