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
  Future<AuthFailure?> signInWithEmailAndPassword({required EmailAddress emailAddress, required Password password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
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