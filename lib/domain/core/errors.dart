import 'failures.dart';

class UnexpectedValueError extends Error{
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    return Error.safeToString('Encountered value failure, terminating... Failure was $valueFailure');
  }
}

class NotAuthenticatedError extends Error{}