import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/value_objects.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final IAuthFacade _authFacade;

  SignInBloc(this._authFacade) : super(SignInState.initial()) {
    on<EmailChanged>((EmailChanged event, emit) {
      return emit(
          state.copyWith(
              showErrorMessages: false,
              emailAddress: EmailAddress(event.emailStr),
              authFailure: const AuthFailure.initial()
          )
      );
    });
    on<PasswordChanged>((event, emit){
      return emit(
          state.copyWith(
              showErrorMessages: false,
              password: Password(event.passwordStr),
              authFailure: const AuthFailure.initial()
          )
      );
    });
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      await _performActionOnAuthFacade(_authFacade.registerWithEmailAndPassword);
    });
    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      await _performActionOnAuthFacade(_authFacade.signInWithEmailAndPassword);
    });
    on<SignInWithGooglePressed>((event, emit) async {
      emit(
          state.copyWith(
              isSubmitting: true,
              authFailure: const AuthFailure.initial()
          )
      );
      final googleAuthFailureOrSuccess = await _authFacade.signInWithGoogle();
      return emit(
          state.copyWith(
              isSubmitting: false,
              authFailure: googleAuthFailureOrSuccess
          )
      );
    });
  }

  // helper method
  Future<void> _performActionOnAuthFacade(Future<AuthFailure?> Function({required EmailAddress emailAddress, required Password password}) forwardedAuthFacadeCall) async {
    if(state.emailAddress.isValid && state.password.isValid){
      emit(
          state.copyWith(
              isSubmitting: true,
              authFailure: const AuthFailure.initial()
          )
      );
      // if there is a failure, emailAndPasswordAuthFailure will return a value
      final emailAndPasswordAuthFailure = await forwardedAuthFacadeCall(emailAddress: state.emailAddress, password: state.password);
      return emit(
          state.copyWith(
              isSubmitting: false,
              authFailure: emailAndPasswordAuthFailure
          )
      );
    }
    // invalid email or password
    // default return
    return emit(
        state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailure: const AuthFailure.invalidEmailAndPasswordCombination()
        )
    );
  }
}
