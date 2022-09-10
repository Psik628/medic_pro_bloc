part of 'sign_in_bloc.dart';

@freezed
class SignInState extends Equatable with _$SignInState {
  const factory SignInState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required AuthFailure? authFailure,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
    emailAddress: EmailAddress(''),
    password: Password(''),
    showErrorMessages: false,
    isSubmitting: false,
    authFailure: null,
  );

  // this is required to implement equatable
  const SignInState._();

  @override
  // TODO: implement props
  List<Object?> get props => [this.emailAddress, this.password, this.showErrorMessages, this.isSubmitting, this.authFailure];
}
