part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState{
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loadInProgress() = LoadInProgress;
  const factory ProfileState.loadSuccess(User subjects) = LoadSuccess;
  const factory ProfileState.loadFailure(UserFailure userFailure) =LoadFailure;
}
