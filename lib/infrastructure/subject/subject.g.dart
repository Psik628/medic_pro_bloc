// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class SubjectCollectionReference
    implements
        SubjectQuery,
        FirestoreCollectionReference<Subject, SubjectQuerySnapshot> {
  factory SubjectCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$SubjectCollectionReference;

  static Subject fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Subject.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Subject value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Subject> get reference;

  @override
  SubjectDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<SubjectDocumentReference> add(Subject value);
}

class _$SubjectCollectionReference extends _$SubjectQuery
    implements SubjectCollectionReference {
  factory _$SubjectCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$SubjectCollectionReference._(
      firestore.collection('MSubjects').withConverter(
            fromFirestore: SubjectCollectionReference.fromFirestore,
            toFirestore: SubjectCollectionReference.toFirestore,
          ),
    );
  }

  _$SubjectCollectionReference._(
    CollectionReference<Subject> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Subject> get reference =>
      super.reference as CollectionReference<Subject>;

  @override
  SubjectDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return SubjectDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<SubjectDocumentReference> add(Subject value) {
    return reference.add(value).then((ref) => SubjectDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$SubjectCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class SubjectDocumentReference
    extends FirestoreDocumentReference<Subject, SubjectDocumentSnapshot> {
  factory SubjectDocumentReference(DocumentReference<Subject> reference) =
      _$SubjectDocumentReference;

  DocumentReference<Subject> get reference;

  /// A reference to the [SubjectCollectionReference] containing this document.
  SubjectCollectionReference get parent {
    return _$SubjectCollectionReference(reference.firestore);
  }

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  @override
  Stream<SubjectDocumentSnapshot> snapshots();

  @override
  Future<SubjectDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String titleUI,
  });

  Future<void> set(Subject value);
}

class _$SubjectDocumentReference
    extends FirestoreDocumentReference<Subject, SubjectDocumentSnapshot>
    implements SubjectDocumentReference {
  _$SubjectDocumentReference(this.reference);

  @override
  final DocumentReference<Subject> reference;

  /// A reference to the [SubjectCollectionReference] containing this document.
  SubjectCollectionReference get parent {
    return _$SubjectCollectionReference(reference.firestore);
  }

  late final CategoryCollectionReference categories =
      _$CategoryCollectionReference(
    reference,
  );

  @override
  Stream<SubjectDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return SubjectDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<SubjectDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return SubjectDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? titleUI = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (titleUI != _sentinel) "titleUI": titleUI as String,
    };

    return reference.update(json);
  }

  Future<void> set(Subject value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class SubjectDocumentSnapshot extends FirestoreDocumentSnapshot<Subject> {
  SubjectDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Subject> snapshot;

  @override
  SubjectDocumentReference get reference {
    return SubjectDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Subject? data;
}

abstract class SubjectQuery
    implements QueryReference<Subject, SubjectQuerySnapshot> {
  @override
  SubjectQuery limit(int limit);

  @override
  SubjectQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  SubjectQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  SubjectQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  SubjectQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  SubjectQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  SubjectQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  SubjectQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  });

  SubjectQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  });

  SubjectQuery orderByTitleUI({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  });
}

class _$SubjectQuery extends QueryReference<Subject, SubjectQuerySnapshot>
    implements SubjectQuery {
  _$SubjectQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Subject> reference;

  SubjectQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Subject> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return SubjectQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<SubjectDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: SubjectDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return SubjectQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<SubjectQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<SubjectQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  SubjectQuery limit(int limit) {
    return _$SubjectQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  SubjectQuery limitToLast(int limit) {
    return _$SubjectQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  SubjectQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubjectQuery(query, _collection);
  }

  SubjectQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$SubjectQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  SubjectQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubjectQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubjectQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubjectQuery(
      reference.where(
        _$SubjectFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubjectQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubjectQuery(
      reference.where(
        _$SubjectFieldMap["titleUI"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubjectQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubjectQuery(query, _collection);
  }

  SubjectQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$SubjectFieldMap["title"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubjectQuery(query, _collection);
  }

  SubjectQuery orderByTitleUI({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubjectDocumentSnapshot? startAtDocument,
    SubjectDocumentSnapshot? endAtDocument,
    SubjectDocumentSnapshot? endBeforeDocument,
    SubjectDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$SubjectFieldMap["titleUI"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubjectQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$SubjectQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class SubjectQuerySnapshot
    extends FirestoreQuerySnapshot<Subject, SubjectQueryDocumentSnapshot> {
  SubjectQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Subject> snapshot;

  @override
  final List<SubjectQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<SubjectDocumentSnapshot>> docChanges;
}

class SubjectQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Subject>
    implements SubjectDocumentSnapshot {
  SubjectQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Subject> snapshot;

  @override
  SubjectDocumentReference get reference {
    return SubjectDocumentReference(snapshot.reference);
  }

  @override
  final Subject data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CategoryCollectionReference
    implements
        CategoryQuery,
        FirestoreCollectionReference<Category, CategoryQuerySnapshot> {
  factory CategoryCollectionReference(
    DocumentReference<Subject> parent,
  ) = _$CategoryCollectionReference;

  static Category fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Category.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Category value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Category> get reference;

  /// A reference to the containing [SubjectDocumentReference] if this is a subcollection.
  SubjectDocumentReference get parent;

  @override
  CategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CategoryDocumentReference> add(Category value);
}

class _$CategoryCollectionReference extends _$CategoryQuery
    implements CategoryCollectionReference {
  factory _$CategoryCollectionReference(
    DocumentReference<Subject> parent,
  ) {
    return _$CategoryCollectionReference._(
      SubjectDocumentReference(parent),
      parent.collection('categories').withConverter(
            fromFirestore: CategoryCollectionReference.fromFirestore,
            toFirestore: CategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$CategoryCollectionReference._(
    this.parent,
    CollectionReference<Category> reference,
  ) : super(reference, reference);

  @override
  final SubjectDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Category> get reference =>
      super.reference as CollectionReference<Category>;

  @override
  CategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CategoryDocumentReference> add(Category value) {
    return reference.add(value).then((ref) => CategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CategoryDocumentReference
    extends FirestoreDocumentReference<Category, CategoryDocumentSnapshot> {
  factory CategoryDocumentReference(DocumentReference<Category> reference) =
      _$CategoryDocumentReference;

  DocumentReference<Category> get reference;

  /// A reference to the [CategoryCollectionReference] containing this document.
  CategoryCollectionReference get parent {
    return _$CategoryCollectionReference(
      reference.parent.parent!.withConverter<Subject>(
        fromFirestore: SubjectCollectionReference.fromFirestore,
        toFirestore: SubjectCollectionReference.toFirestore,
      ),
    );
  }

  late final SubcategoryCollectionReference subcategories =
      _$SubcategoryCollectionReference(
    reference,
  );

  @override
  Stream<CategoryDocumentSnapshot> snapshots();

  @override
  Future<CategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String titleUI,
  });

  Future<void> set(Category value);
}

class _$CategoryDocumentReference
    extends FirestoreDocumentReference<Category, CategoryDocumentSnapshot>
    implements CategoryDocumentReference {
  _$CategoryDocumentReference(this.reference);

  @override
  final DocumentReference<Category> reference;

  /// A reference to the [CategoryCollectionReference] containing this document.
  CategoryCollectionReference get parent {
    return _$CategoryCollectionReference(
      reference.parent.parent!.withConverter<Subject>(
        fromFirestore: SubjectCollectionReference.fromFirestore,
        toFirestore: SubjectCollectionReference.toFirestore,
      ),
    );
  }

  late final SubcategoryCollectionReference subcategories =
      _$SubcategoryCollectionReference(
    reference,
  );

  @override
  Stream<CategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return CategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<CategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return CategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? titleUI = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (titleUI != _sentinel) "titleUI": titleUI as String,
    };

    return reference.update(json);
  }

  Future<void> set(Category value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class CategoryDocumentSnapshot extends FirestoreDocumentSnapshot<Category> {
  CategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Category> snapshot;

  @override
  CategoryDocumentReference get reference {
    return CategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Category? data;
}

abstract class CategoryQuery
    implements QueryReference<Category, CategoryQuerySnapshot> {
  @override
  CategoryQuery limit(int limit);

  @override
  CategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CategoryQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  CategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });

  CategoryQuery orderByTitleUI({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$CategoryQuery extends QueryReference<Category, CategoryQuerySnapshot>
    implements CategoryQuery {
  _$CategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Category> reference;

  CategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Category> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return CategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<CategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: CategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return CategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<CategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<CategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  CategoryQuery limit(int limit) {
    return _$CategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  CategoryQuery limitToLast(int limit) {
    return _$CategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  CategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CategoryQuery(query, _collection);
  }

  CategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$CategoryQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  CategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      reference.where(
        _$CategoryFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CategoryQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CategoryQuery(
      reference.where(
        _$CategoryFieldMap["titleUI"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CategoryQuery(query, _collection);
  }

  CategoryQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$CategoryFieldMap["title"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CategoryQuery(query, _collection);
  }

  CategoryQuery orderByTitleUI({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CategoryDocumentSnapshot? startAtDocument,
    CategoryDocumentSnapshot? endAtDocument,
    CategoryDocumentSnapshot? endBeforeDocument,
    CategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$CategoryFieldMap["titleUI"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CategoryQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$CategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CategoryQuerySnapshot
    extends FirestoreQuerySnapshot<Category, CategoryQueryDocumentSnapshot> {
  CategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Category> snapshot;

  @override
  final List<CategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CategoryDocumentSnapshot>> docChanges;
}

class CategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Category>
    implements CategoryDocumentSnapshot {
  CategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Category> snapshot;

  @override
  CategoryDocumentReference get reference {
    return CategoryDocumentReference(snapshot.reference);
  }

  @override
  final Category data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class SubcategoryCollectionReference
    implements
        SubcategoryQuery,
        FirestoreCollectionReference<Subcategory, SubcategoryQuerySnapshot> {
  factory SubcategoryCollectionReference(
    DocumentReference<Category> parent,
  ) = _$SubcategoryCollectionReference;

  static Subcategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Subcategory.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Subcategory value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Subcategory> get reference;

  /// A reference to the containing [CategoryDocumentReference] if this is a subcollection.
  CategoryDocumentReference get parent;

  @override
  SubcategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<SubcategoryDocumentReference> add(Subcategory value);
}

class _$SubcategoryCollectionReference extends _$SubcategoryQuery
    implements SubcategoryCollectionReference {
  factory _$SubcategoryCollectionReference(
    DocumentReference<Category> parent,
  ) {
    return _$SubcategoryCollectionReference._(
      CategoryDocumentReference(parent),
      parent.collection('subcategories').withConverter(
            fromFirestore: SubcategoryCollectionReference.fromFirestore,
            toFirestore: SubcategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$SubcategoryCollectionReference._(
    this.parent,
    CollectionReference<Subcategory> reference,
  ) : super(reference, reference);

  @override
  final CategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Subcategory> get reference =>
      super.reference as CollectionReference<Subcategory>;

  @override
  SubcategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return SubcategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<SubcategoryDocumentReference> add(Subcategory value) {
    return reference
        .add(value)
        .then((ref) => SubcategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$SubcategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class SubcategoryDocumentReference extends FirestoreDocumentReference<
    Subcategory, SubcategoryDocumentSnapshot> {
  factory SubcategoryDocumentReference(
          DocumentReference<Subcategory> reference) =
      _$SubcategoryDocumentReference;

  DocumentReference<Subcategory> get reference;

  /// A reference to the [SubcategoryCollectionReference] containing this document.
  SubcategoryCollectionReference get parent {
    return _$SubcategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: CategoryCollectionReference.fromFirestore,
        toFirestore: CategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final ArticleCollectionReference articles = _$ArticleCollectionReference(
    reference,
  );

  late final QuestionSectionCollectionReference questionsections =
      _$QuestionSectionCollectionReference(
    reference,
  );

  @override
  Stream<SubcategoryDocumentSnapshot> snapshots();

  @override
  Future<SubcategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String titleUI,
  });

  Future<void> set(Subcategory value);
}

class _$SubcategoryDocumentReference
    extends FirestoreDocumentReference<Subcategory, SubcategoryDocumentSnapshot>
    implements SubcategoryDocumentReference {
  _$SubcategoryDocumentReference(this.reference);

  @override
  final DocumentReference<Subcategory> reference;

  /// A reference to the [SubcategoryCollectionReference] containing this document.
  SubcategoryCollectionReference get parent {
    return _$SubcategoryCollectionReference(
      reference.parent.parent!.withConverter<Category>(
        fromFirestore: CategoryCollectionReference.fromFirestore,
        toFirestore: CategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final ArticleCollectionReference articles = _$ArticleCollectionReference(
    reference,
  );

  late final QuestionSectionCollectionReference questionsections =
      _$QuestionSectionCollectionReference(
    reference,
  );

  @override
  Stream<SubcategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return SubcategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<SubcategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return SubcategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? titleUI = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (titleUI != _sentinel) "titleUI": titleUI as String,
    };

    return reference.update(json);
  }

  Future<void> set(Subcategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class SubcategoryDocumentSnapshot
    extends FirestoreDocumentSnapshot<Subcategory> {
  SubcategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Subcategory> snapshot;

  @override
  SubcategoryDocumentReference get reference {
    return SubcategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Subcategory? data;
}

abstract class SubcategoryQuery
    implements QueryReference<Subcategory, SubcategoryQuerySnapshot> {
  @override
  SubcategoryQuery limit(int limit);

  @override
  SubcategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  SubcategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  SubcategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  SubcategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  SubcategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  SubcategoryQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  SubcategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  });

  SubcategoryQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  });

  SubcategoryQuery orderByTitleUI({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$SubcategoryQuery
    extends QueryReference<Subcategory, SubcategoryQuerySnapshot>
    implements SubcategoryQuery {
  _$SubcategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Subcategory> reference;

  SubcategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Subcategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return SubcategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<SubcategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: SubcategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return SubcategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<SubcategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<SubcategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  SubcategoryQuery limit(int limit) {
    return _$SubcategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  SubcategoryQuery limitToLast(int limit) {
    return _$SubcategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  SubcategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubcategoryQuery(query, _collection);
  }

  SubcategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$SubcategoryQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  SubcategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubcategoryQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubcategoryQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubcategoryQuery(
      reference.where(
        _$SubcategoryFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubcategoryQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$SubcategoryQuery(
      reference.where(
        _$SubcategoryFieldMap["titleUI"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  SubcategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubcategoryQuery(query, _collection);
  }

  SubcategoryQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$SubcategoryFieldMap["title"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubcategoryQuery(query, _collection);
  }

  SubcategoryQuery orderByTitleUI({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SubcategoryDocumentSnapshot? startAtDocument,
    SubcategoryDocumentSnapshot? endAtDocument,
    SubcategoryDocumentSnapshot? endBeforeDocument,
    SubcategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$SubcategoryFieldMap["titleUI"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$SubcategoryQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$SubcategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class SubcategoryQuerySnapshot extends FirestoreQuerySnapshot<Subcategory,
    SubcategoryQueryDocumentSnapshot> {
  SubcategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Subcategory> snapshot;

  @override
  final List<SubcategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<SubcategoryDocumentSnapshot>> docChanges;
}

class SubcategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Subcategory>
    implements SubcategoryDocumentSnapshot {
  SubcategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Subcategory> snapshot;

  @override
  SubcategoryDocumentReference get reference {
    return SubcategoryDocumentReference(snapshot.reference);
  }

  @override
  final Subcategory data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ArticleCollectionReference
    implements
        ArticleQuery,
        FirestoreCollectionReference<Article, ArticleQuerySnapshot> {
  factory ArticleCollectionReference(
    DocumentReference<Subcategory> parent,
  ) = _$ArticleCollectionReference;

  static Article fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Article.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Article value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Article> get reference;

  /// A reference to the containing [SubcategoryDocumentReference] if this is a subcollection.
  SubcategoryDocumentReference get parent;

  @override
  ArticleDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ArticleDocumentReference> add(Article value);
}

class _$ArticleCollectionReference extends _$ArticleQuery
    implements ArticleCollectionReference {
  factory _$ArticleCollectionReference(
    DocumentReference<Subcategory> parent,
  ) {
    return _$ArticleCollectionReference._(
      SubcategoryDocumentReference(parent),
      parent.collection('articles').withConverter(
            fromFirestore: ArticleCollectionReference.fromFirestore,
            toFirestore: ArticleCollectionReference.toFirestore,
          ),
    );
  }

  _$ArticleCollectionReference._(
    this.parent,
    CollectionReference<Article> reference,
  ) : super(reference, reference);

  @override
  final SubcategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Article> get reference =>
      super.reference as CollectionReference<Article>;

  @override
  ArticleDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ArticleDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ArticleDocumentReference> add(Article value) {
    return reference.add(value).then((ref) => ArticleDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ArticleCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ArticleDocumentReference
    extends FirestoreDocumentReference<Article, ArticleDocumentSnapshot> {
  factory ArticleDocumentReference(DocumentReference<Article> reference) =
      _$ArticleDocumentReference;

  DocumentReference<Article> get reference;

  /// A reference to the [ArticleCollectionReference] containing this document.
  ArticleCollectionReference get parent {
    return _$ArticleCollectionReference(
      reference.parent.parent!.withConverter<Subcategory>(
        fromFirestore: SubcategoryCollectionReference.fromFirestore,
        toFirestore: SubcategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ArticleDocumentSnapshot> snapshots();

  @override
  Future<ArticleDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String titleUI,
  });

  Future<void> set(Article value);
}

class _$ArticleDocumentReference
    extends FirestoreDocumentReference<Article, ArticleDocumentSnapshot>
    implements ArticleDocumentReference {
  _$ArticleDocumentReference(this.reference);

  @override
  final DocumentReference<Article> reference;

  /// A reference to the [ArticleCollectionReference] containing this document.
  ArticleCollectionReference get parent {
    return _$ArticleCollectionReference(
      reference.parent.parent!.withConverter<Subcategory>(
        fromFirestore: SubcategoryCollectionReference.fromFirestore,
        toFirestore: SubcategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ArticleDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ArticleDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ArticleDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ArticleDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? titleUI = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (titleUI != _sentinel) "titleUI": titleUI as String,
    };

    return reference.update(json);
  }

  Future<void> set(Article value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ArticleDocumentSnapshot extends FirestoreDocumentSnapshot<Article> {
  ArticleDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Article> snapshot;

  @override
  ArticleDocumentReference get reference {
    return ArticleDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Article? data;
}

abstract class ArticleQuery
    implements QueryReference<Article, ArticleQuerySnapshot> {
  @override
  ArticleQuery limit(int limit);

  @override
  ArticleQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ArticleQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ArticleQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ArticleQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ArticleQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ArticleQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  ArticleQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  });

  ArticleQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  });

  ArticleQuery orderByTitleUI({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  });
}

class _$ArticleQuery extends QueryReference<Article, ArticleQuerySnapshot>
    implements ArticleQuery {
  _$ArticleQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Article> reference;

  ArticleQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Article> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ArticleQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ArticleDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ArticleDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ArticleQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ArticleQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ArticleQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ArticleQuery limit(int limit) {
    return _$ArticleQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ArticleQuery limitToLast(int limit) {
    return _$ArticleQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ArticleQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ArticleQuery(query, _collection);
  }

  ArticleQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ArticleQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  ArticleQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ArticleQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ArticleQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ArticleQuery(
      reference.where(
        _$ArticleFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ArticleQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ArticleQuery(
      reference.where(
        _$ArticleFieldMap["titleUI"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ArticleQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ArticleQuery(query, _collection);
  }

  ArticleQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$ArticleFieldMap["title"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ArticleQuery(query, _collection);
  }

  ArticleQuery orderByTitleUI({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleDocumentSnapshot? startAtDocument,
    ArticleDocumentSnapshot? endAtDocument,
    ArticleDocumentSnapshot? endBeforeDocument,
    ArticleDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ArticleFieldMap["titleUI"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ArticleQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ArticleQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ArticleQuerySnapshot
    extends FirestoreQuerySnapshot<Article, ArticleQueryDocumentSnapshot> {
  ArticleQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Article> snapshot;

  @override
  final List<ArticleQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ArticleDocumentSnapshot>> docChanges;
}

class ArticleQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Article>
    implements ArticleDocumentSnapshot {
  ArticleQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Article> snapshot;

  @override
  ArticleDocumentReference get reference {
    return ArticleDocumentReference(snapshot.reference);
  }

  @override
  final Article data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class QuestionSectionCollectionReference
    implements
        QuestionSectionQuery,
        FirestoreCollectionReference<QuestionSection,
            QuestionSectionQuerySnapshot> {
  factory QuestionSectionCollectionReference(
    DocumentReference<Subcategory> parent,
  ) = _$QuestionSectionCollectionReference;

  static QuestionSection fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return QuestionSection.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    QuestionSection value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<QuestionSection> get reference;

  /// A reference to the containing [SubcategoryDocumentReference] if this is a subcollection.
  SubcategoryDocumentReference get parent;

  @override
  QuestionSectionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<QuestionSectionDocumentReference> add(QuestionSection value);
}

class _$QuestionSectionCollectionReference extends _$QuestionSectionQuery
    implements QuestionSectionCollectionReference {
  factory _$QuestionSectionCollectionReference(
    DocumentReference<Subcategory> parent,
  ) {
    return _$QuestionSectionCollectionReference._(
      SubcategoryDocumentReference(parent),
      parent.collection('questionsections').withConverter(
            fromFirestore: QuestionSectionCollectionReference.fromFirestore,
            toFirestore: QuestionSectionCollectionReference.toFirestore,
          ),
    );
  }

  _$QuestionSectionCollectionReference._(
    this.parent,
    CollectionReference<QuestionSection> reference,
  ) : super(reference, reference);

  @override
  final SubcategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<QuestionSection> get reference =>
      super.reference as CollectionReference<QuestionSection>;

  @override
  QuestionSectionDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return QuestionSectionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<QuestionSectionDocumentReference> add(QuestionSection value) {
    return reference
        .add(value)
        .then((ref) => QuestionSectionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$QuestionSectionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class QuestionSectionDocumentReference
    extends FirestoreDocumentReference<QuestionSection,
        QuestionSectionDocumentSnapshot> {
  factory QuestionSectionDocumentReference(
          DocumentReference<QuestionSection> reference) =
      _$QuestionSectionDocumentReference;

  DocumentReference<QuestionSection> get reference;

  /// A reference to the [QuestionSectionCollectionReference] containing this document.
  QuestionSectionCollectionReference get parent {
    return _$QuestionSectionCollectionReference(
      reference.parent.parent!.withConverter<Subcategory>(
        fromFirestore: SubcategoryCollectionReference.fromFirestore,
        toFirestore: SubcategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final QuestionCollectionReference questions =
      _$QuestionCollectionReference(
    reference,
  );

  @override
  Stream<QuestionSectionDocumentSnapshot> snapshots();

  @override
  Future<QuestionSectionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String titleUI,
  });

  Future<void> set(QuestionSection value);
}

class _$QuestionSectionDocumentReference extends FirestoreDocumentReference<
        QuestionSection, QuestionSectionDocumentSnapshot>
    implements QuestionSectionDocumentReference {
  _$QuestionSectionDocumentReference(this.reference);

  @override
  final DocumentReference<QuestionSection> reference;

  /// A reference to the [QuestionSectionCollectionReference] containing this document.
  QuestionSectionCollectionReference get parent {
    return _$QuestionSectionCollectionReference(
      reference.parent.parent!.withConverter<Subcategory>(
        fromFirestore: SubcategoryCollectionReference.fromFirestore,
        toFirestore: SubcategoryCollectionReference.toFirestore,
      ),
    );
  }

  late final QuestionCollectionReference questions =
      _$QuestionCollectionReference(
    reference,
  );

  @override
  Stream<QuestionSectionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return QuestionSectionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<QuestionSectionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return QuestionSectionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? titleUI = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (titleUI != _sentinel) "titleUI": titleUI as String,
    };

    return reference.update(json);
  }

  Future<void> set(QuestionSection value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionSectionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class QuestionSectionDocumentSnapshot
    extends FirestoreDocumentSnapshot<QuestionSection> {
  QuestionSectionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<QuestionSection> snapshot;

  @override
  QuestionSectionDocumentReference get reference {
    return QuestionSectionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final QuestionSection? data;
}

abstract class QuestionSectionQuery
    implements QueryReference<QuestionSection, QuestionSectionQuerySnapshot> {
  @override
  QuestionSectionQuery limit(int limit);

  @override
  QuestionSectionQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  QuestionSectionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  QuestionSectionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  QuestionSectionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  QuestionSectionQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  QuestionSectionQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  QuestionSectionQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  });

  QuestionSectionQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  });

  QuestionSectionQuery orderByTitleUI({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  });
}

class _$QuestionSectionQuery
    extends QueryReference<QuestionSection, QuestionSectionQuerySnapshot>
    implements QuestionSectionQuery {
  _$QuestionSectionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<QuestionSection> reference;

  QuestionSectionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<QuestionSection> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return QuestionSectionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<QuestionSectionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: QuestionSectionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return QuestionSectionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<QuestionSectionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<QuestionSectionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  QuestionSectionQuery limit(int limit) {
    return _$QuestionSectionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  QuestionSectionQuery limitToLast(int limit) {
    return _$QuestionSectionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  QuestionSectionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionSectionQuery(query, _collection);
  }

  QuestionSectionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$QuestionSectionQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  QuestionSectionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionSectionQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionSectionQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionSectionQuery(
      reference.where(
        _$QuestionSectionFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionSectionQuery whereTitleUI({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionSectionQuery(
      reference.where(
        _$QuestionSectionFieldMap["titleUI"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionSectionQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionSectionQuery(query, _collection);
  }

  QuestionSectionQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$QuestionSectionFieldMap["title"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionSectionQuery(query, _collection);
  }

  QuestionSectionQuery orderByTitleUI({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionSectionDocumentSnapshot? startAtDocument,
    QuestionSectionDocumentSnapshot? endAtDocument,
    QuestionSectionDocumentSnapshot? endBeforeDocument,
    QuestionSectionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$QuestionSectionFieldMap["titleUI"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionSectionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$QuestionSectionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class QuestionSectionQuerySnapshot extends FirestoreQuerySnapshot<
    QuestionSection, QuestionSectionQueryDocumentSnapshot> {
  QuestionSectionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<QuestionSection> snapshot;

  @override
  final List<QuestionSectionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<QuestionSectionDocumentSnapshot>>
      docChanges;
}

class QuestionSectionQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<QuestionSection>
    implements QuestionSectionDocumentSnapshot {
  QuestionSectionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<QuestionSection> snapshot;

  @override
  QuestionSectionDocumentReference get reference {
    return QuestionSectionDocumentReference(snapshot.reference);
  }

  @override
  final QuestionSection data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class QuestionCollectionReference
    implements
        QuestionQuery,
        FirestoreCollectionReference<Question, QuestionQuerySnapshot> {
  factory QuestionCollectionReference(
    DocumentReference<QuestionSection> parent,
  ) = _$QuestionCollectionReference;

  static Question fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Question.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Question value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Question> get reference;

  /// A reference to the containing [QuestionSectionDocumentReference] if this is a subcollection.
  QuestionSectionDocumentReference get parent;

  @override
  QuestionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<QuestionDocumentReference> add(Question value);
}

class _$QuestionCollectionReference extends _$QuestionQuery
    implements QuestionCollectionReference {
  factory _$QuestionCollectionReference(
    DocumentReference<QuestionSection> parent,
  ) {
    return _$QuestionCollectionReference._(
      QuestionSectionDocumentReference(parent),
      parent.collection('questions').withConverter(
            fromFirestore: QuestionCollectionReference.fromFirestore,
            toFirestore: QuestionCollectionReference.toFirestore,
          ),
    );
  }

  _$QuestionCollectionReference._(
    this.parent,
    CollectionReference<Question> reference,
  ) : super(reference, reference);

  @override
  final QuestionSectionDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Question> get reference =>
      super.reference as CollectionReference<Question>;

  @override
  QuestionDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return QuestionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<QuestionDocumentReference> add(Question value) {
    return reference.add(value).then((ref) => QuestionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$QuestionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class QuestionDocumentReference
    extends FirestoreDocumentReference<Question, QuestionDocumentSnapshot> {
  factory QuestionDocumentReference(DocumentReference<Question> reference) =
      _$QuestionDocumentReference;

  DocumentReference<Question> get reference;

  /// A reference to the [QuestionCollectionReference] containing this document.
  QuestionCollectionReference get parent {
    return _$QuestionCollectionReference(
      reference.parent.parent!.withConverter<QuestionSection>(
        fromFirestore: QuestionSectionCollectionReference.fromFirestore,
        toFirestore: QuestionSectionCollectionReference.toFirestore,
      ),
    );
  }

  late final OptionCollectionReference options = _$OptionCollectionReference(
    reference,
  );

  @override
  Stream<QuestionDocumentSnapshot> snapshots();

  @override
  Future<QuestionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String content,
    List<dynamic> options,
    List<dynamic> selectedOptions,
  });

  Future<void> set(Question value);
}

class _$QuestionDocumentReference
    extends FirestoreDocumentReference<Question, QuestionDocumentSnapshot>
    implements QuestionDocumentReference {
  _$QuestionDocumentReference(this.reference);

  @override
  final DocumentReference<Question> reference;

  /// A reference to the [QuestionCollectionReference] containing this document.
  QuestionCollectionReference get parent {
    return _$QuestionCollectionReference(
      reference.parent.parent!.withConverter<QuestionSection>(
        fromFirestore: QuestionSectionCollectionReference.fromFirestore,
        toFirestore: QuestionSectionCollectionReference.toFirestore,
      ),
    );
  }

  late final OptionCollectionReference options = _$OptionCollectionReference(
    reference,
  );

  @override
  Stream<QuestionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return QuestionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<QuestionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return QuestionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? title = _sentinel,
    Object? content = _sentinel,
    Object? options = _sentinel,
    Object? selectedOptions = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (content != _sentinel) "content": content as String,
      if (options != _sentinel) "options": options as List<dynamic>,
      if (selectedOptions != _sentinel)
        "selectedOptions": selectedOptions as List<dynamic>,
    };

    return reference.update(json);
  }

  Future<void> set(Question value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class QuestionDocumentSnapshot extends FirestoreDocumentSnapshot<Question> {
  QuestionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Question> snapshot;

  @override
  QuestionDocumentReference get reference {
    return QuestionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Question? data;
}

abstract class QuestionQuery
    implements QueryReference<Question, QuestionQuerySnapshot> {
  @override
  QuestionQuery limit(int limit);

  @override
  QuestionQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  QuestionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  QuestionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  QuestionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  QuestionQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  QuestionQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  QuestionQuery whereOptions({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  });
  QuestionQuery whereSelectedOptions({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  });

  QuestionQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });

  QuestionQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });

  QuestionQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });

  QuestionQuery orderByOptions({
    bool descending = false,
    List<dynamic> startAt,
    List<dynamic> startAfter,
    List<dynamic> endAt,
    List<dynamic> endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });

  QuestionQuery orderBySelectedOptions({
    bool descending = false,
    List<dynamic> startAt,
    List<dynamic> startAfter,
    List<dynamic> endAt,
    List<dynamic> endBefore,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  });
}

class _$QuestionQuery extends QueryReference<Question, QuestionQuerySnapshot>
    implements QuestionQuery {
  _$QuestionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Question> reference;

  QuestionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Question> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return QuestionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<QuestionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: QuestionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return QuestionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<QuestionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<QuestionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  QuestionQuery limit(int limit) {
    return _$QuestionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  QuestionQuery limitToLast(int limit) {
    return _$QuestionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  QuestionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  QuestionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$QuestionQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  QuestionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionQuery(
      reference.where(
        _$QuestionFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$QuestionQuery(
      reference.where(
        _$QuestionFieldMap["content"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  QuestionQuery whereOptions({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  }) {
    return _$QuestionQuery(
      reference.where(
        _$QuestionFieldMap["options"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  QuestionQuery whereSelectedOptions({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  }) {
    return _$QuestionQuery(
      reference.where(
        _$QuestionFieldMap["selectedOptions"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  QuestionQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  QuestionQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$QuestionFieldMap["title"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  QuestionQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$QuestionFieldMap["content"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  QuestionQuery orderByOptions({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$QuestionFieldMap["options"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  QuestionQuery orderBySelectedOptions({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    QuestionDocumentSnapshot? startAtDocument,
    QuestionDocumentSnapshot? endAtDocument,
    QuestionDocumentSnapshot? endBeforeDocument,
    QuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$QuestionFieldMap["selectedOptions"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$QuestionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$QuestionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class QuestionQuerySnapshot
    extends FirestoreQuerySnapshot<Question, QuestionQueryDocumentSnapshot> {
  QuestionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Question> snapshot;

  @override
  final List<QuestionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<QuestionDocumentSnapshot>> docChanges;
}

class QuestionQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Question>
    implements QuestionDocumentSnapshot {
  QuestionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Question> snapshot;

  @override
  QuestionDocumentReference get reference {
    return QuestionDocumentReference(snapshot.reference);
  }

  @override
  final Question data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class OptionCollectionReference
    implements
        OptionQuery,
        FirestoreCollectionReference<Option, OptionQuerySnapshot> {
  factory OptionCollectionReference(
    DocumentReference<Question> parent,
  ) = _$OptionCollectionReference;

  static Option fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Option.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Option value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Option> get reference;

  /// A reference to the containing [QuestionDocumentReference] if this is a subcollection.
  QuestionDocumentReference get parent;

  @override
  OptionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<OptionDocumentReference> add(Option value);
}

class _$OptionCollectionReference extends _$OptionQuery
    implements OptionCollectionReference {
  factory _$OptionCollectionReference(
    DocumentReference<Question> parent,
  ) {
    return _$OptionCollectionReference._(
      QuestionDocumentReference(parent),
      parent.collection('options').withConverter(
            fromFirestore: OptionCollectionReference.fromFirestore,
            toFirestore: OptionCollectionReference.toFirestore,
          ),
    );
  }

  _$OptionCollectionReference._(
    this.parent,
    CollectionReference<Option> reference,
  ) : super(reference, reference);

  @override
  final QuestionDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Option> get reference =>
      super.reference as CollectionReference<Option>;

  @override
  OptionDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return OptionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<OptionDocumentReference> add(Option value) {
    return reference.add(value).then((ref) => OptionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$OptionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class OptionDocumentReference
    extends FirestoreDocumentReference<Option, OptionDocumentSnapshot> {
  factory OptionDocumentReference(DocumentReference<Option> reference) =
      _$OptionDocumentReference;

  DocumentReference<Option> get reference;

  /// A reference to the [OptionCollectionReference] containing this document.
  OptionCollectionReference get parent {
    return _$OptionCollectionReference(
      reference.parent.parent!.withConverter<Question>(
        fromFirestore: QuestionCollectionReference.fromFirestore,
        toFirestore: QuestionCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<OptionDocumentSnapshot> snapshots();

  @override
  Future<OptionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String content,
    bool correct,
    bool isSelected,
  });

  Future<void> set(Option value);
}

class _$OptionDocumentReference
    extends FirestoreDocumentReference<Option, OptionDocumentSnapshot>
    implements OptionDocumentReference {
  _$OptionDocumentReference(this.reference);

  @override
  final DocumentReference<Option> reference;

  /// A reference to the [OptionCollectionReference] containing this document.
  OptionCollectionReference get parent {
    return _$OptionCollectionReference(
      reference.parent.parent!.withConverter<Question>(
        fromFirestore: QuestionCollectionReference.fromFirestore,
        toFirestore: QuestionCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<OptionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return OptionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<OptionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return OptionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? content = _sentinel,
    Object? correct = _sentinel,
    Object? isSelected = _sentinel,
  }) async {
    final json = {
      if (content != _sentinel) "content": content as String,
      if (correct != _sentinel) "correct": correct as bool,
      if (isSelected != _sentinel) "isSelected": isSelected as bool,
    };

    return reference.update(json);
  }

  Future<void> set(Option value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is OptionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class OptionDocumentSnapshot extends FirestoreDocumentSnapshot<Option> {
  OptionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Option> snapshot;

  @override
  OptionDocumentReference get reference {
    return OptionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Option? data;
}

abstract class OptionQuery
    implements QueryReference<Option, OptionQuerySnapshot> {
  @override
  OptionQuery limit(int limit);

  @override
  OptionQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  OptionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  OptionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  OptionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OptionQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OptionQuery whereCorrect({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  OptionQuery whereIsSelected({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });

  OptionQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  });

  OptionQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  });

  OptionQuery orderByCorrect({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  });

  OptionQuery orderByIsSelected({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  });
}

class _$OptionQuery extends QueryReference<Option, OptionQuerySnapshot>
    implements OptionQuery {
  _$OptionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Option> reference;

  OptionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Option> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return OptionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<OptionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: OptionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return OptionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<OptionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<OptionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  OptionQuery limit(int limit) {
    return _$OptionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  OptionQuery limitToLast(int limit) {
    return _$OptionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  OptionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OptionQuery(query, _collection);
  }

  OptionQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$OptionQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  OptionQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OptionQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OptionQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OptionQuery(
      reference.where(
        _$OptionFieldMap["content"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OptionQuery whereCorrect({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$OptionQuery(
      reference.where(
        _$OptionFieldMap["correct"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OptionQuery whereIsSelected({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$OptionQuery(
      reference.where(
        _$OptionFieldMap["isSelected"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OptionQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OptionQuery(query, _collection);
  }

  OptionQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$OptionFieldMap["content"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OptionQuery(query, _collection);
  }

  OptionQuery orderByCorrect({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$OptionFieldMap["correct"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OptionQuery(query, _collection);
  }

  OptionQuery orderByIsSelected({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OptionDocumentSnapshot? startAtDocument,
    OptionDocumentSnapshot? endAtDocument,
    OptionDocumentSnapshot? endBeforeDocument,
    OptionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$OptionFieldMap["isSelected"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OptionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$OptionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class OptionQuerySnapshot
    extends FirestoreQuerySnapshot<Option, OptionQueryDocumentSnapshot> {
  OptionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Option> snapshot;

  @override
  final List<OptionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<OptionDocumentSnapshot>> docChanges;
}

class OptionQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Option>
    implements OptionDocumentSnapshot {
  OptionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Option> snapshot;

  @override
  OptionDocumentReference get reference {
    return OptionDocumentReference(snapshot.reference);
  }

  @override
  final Option data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      json['title'] as String,
      json['titleUI'] as String,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'title': instance.title,
      'titleUI': instance.titleUI,
    };
