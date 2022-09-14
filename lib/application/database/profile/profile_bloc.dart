import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/user/i_user_repository.dart';
import 'package:medic_pro_bloc/domain/user/user_failure.dart';
import 'package:meta/meta.dart';

import '../../../domain/user/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IUserRepository _userRepository;

  StreamSubscription<Either<UserFailure, User>>? _userStreamSubscription;

  ProfileBloc(this._userRepository) : super(const ProfileState.initial()) {
    on<WatchProfileStarted>((WatchProfileStarted event, emit) async {
      emit(const ProfileState.loadInProgress());
      await _userStreamSubscription?.cancel();
      // listen to repository
      _userStreamSubscription = _userRepository.watchProfileById(event.id).listen(
        (failureOrUser) {
          // emitting another event
          add(ProfileEvent.profileDataReceived(failureOrUser));
        },
      );
    });

    on<ProfileDataReceived>((ProfileDataReceived event, emit) async {
      event.failureOrUser.fold(
              (UserFailure failure) => {
            emit(ProfileState.loadFailure(failure))
          },
              (User user) => {
            emit(ProfileState.loadSuccess(user))
          }
      );
    });
  }
}
