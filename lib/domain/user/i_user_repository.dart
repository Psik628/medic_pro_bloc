import 'package:dartz/dartz.dart';
import 'package:medic_pro_bloc/domain/user/user_failure.dart';
import 'package:medic_pro_bloc/domain/user/user.dart' as Entity;

abstract class IUserRepository{
  Stream<Either<UserFailure, Entity.User>> watchProfileById(String id);
}