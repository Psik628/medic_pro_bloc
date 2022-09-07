// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i13;
import 'application/navigation/navigation_bloc.dart' as _i10;
import 'application/sign_in/sign_in_bloc.dart' as _i11;
import 'application/subject/subject_bloc.dart' as _i12;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/subject/i_subject_repository.dart' as _i8;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/core/firebase_injectable_module.dart' as _i14;
import 'infrastructure/subject/subject_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.lazySingleton<_i8.ISubjectRepository>(
      () => _i9.SubjectRepository(get<_i4.FirebaseFirestore>()));
  gh.factory<_i10.NavigationBloc>(() => _i10.NavigationBloc());
  gh.factory<_i11.SignInBloc>(() => _i11.SignInBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i12.SubjectBloc>(
      () => _i12.SubjectBloc(get<_i8.ISubjectRepository>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
