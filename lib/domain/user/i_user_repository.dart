import 'package:dartz/dartz.dart';
import 'package:medic_pro_bloc/domain/user/user_failure.dart';
import 'package:medic_pro_bloc/domain/auth/user.dart' as Entity;

abstract class IUserRepository{
  Stream<Either<UserFailure, List<Entity.User>>> watchProfile();
}