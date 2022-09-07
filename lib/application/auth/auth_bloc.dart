import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart' as Auth;

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      print('checking user login');
      final Auth.User? authenticatedUser = _authFacade.getCurrentUser();
      print(authenticatedUser);
      if(authenticatedUser == null){
        return emit(
            const AuthState.unAuthenticated()
        );
      }
      return emit(
          const AuthState.authenticated()
      );
    });
    on<SignedOut>((event, emit) async {
      await _authFacade.signOut();
      return emit(
          const AuthState.unAuthenticated()
      );
    });
  }
}