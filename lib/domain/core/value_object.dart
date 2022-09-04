import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool get isValid => value.isRight();

  /// throws [UnexpectedValueError] containing [ValueFailure]
  T getOrCrash(){
    return value.fold((l) => throw UnexpectedValueError(l),(r) => r);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String>{

  final Either<ValueFailure<String>, String> value;

  const UniqueId._(this.value);

  factory UniqueId() {
    return UniqueId._(
        right(Uuid().v1())
    );
  }

  factory UniqueId.fromUniqueId(String uniqueId) {
    return UniqueId._(
        right(uniqueId)
    );
  }
}