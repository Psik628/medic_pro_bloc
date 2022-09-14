part of 'profile_bloc.dart';


@freezed
class ProfileEvent with _$ProfileEvent{
  const factory ProfileEvent.watchProfile(String id) = WatchProfileStarted;
  const factory ProfileEvent.profileDataReceived(Either<UserFailure, User> failureOrUser) = ProfileDataReceived;
}
