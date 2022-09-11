import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/user/i_user_repository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final IUserRepository _userRepository;

  ProfileBloc(this._userRepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
