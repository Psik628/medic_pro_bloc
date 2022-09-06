import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/auth/auth_failure.dart';
import 'package:medic_pro_bloc/domain/auth/i_auth_facade.dart';
import 'package:medic_pro_bloc/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medic_pro_bloc/infrastructure/auth/firebase_user_mapper.dart';
import '../../domain/auth/user.dart' as Entity;


@Injectable(as: IAuthFacade)
class FirebaseAuthFacade extends IAuthFacade{

  late final FirebaseAuth _firebaseAuth;
  late final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Entity.User? getCurrentUser() {
    // using extension method
    return _firebaseAuth.currentUser == null ? null : _firebaseAuth.currentUser!.toDomain();
  }

  @override
  Future<AuthFailure?> registerWithEmailAndPassword({required EmailAddress emailAddress, required Password password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AuthFailure?> signInWithEmailAndPassword({required EmailAddress emailAddress, required Password password}) async {
    final emailRawValue = emailAddress.getOrCrash();
    final passwordRawValue = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailRawValue,
        password: passwordRawValue,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      // todo makes codes constants
      if (e.code == 'ERROR_WRONG_PASSWORD' || e.code == 'ERROR_USER_NOT_FOUND') {
        return const AuthFailure.invalidEmailAndPasswordCombination();
      } else {
        return const AuthFailure.serverError();
      }
    }
  }

  @override
  Future<AuthFailure?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
  
}