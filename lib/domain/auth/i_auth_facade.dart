import '../../domain/auth/user.dart' as Auth;
import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Auth.User? getCurrentUser();
  Future<AuthFailure?> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<AuthFailure?> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<AuthFailure?> signInWithGoogle();
  Future<void> signOut();
}
