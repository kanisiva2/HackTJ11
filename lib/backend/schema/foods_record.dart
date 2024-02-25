import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodsRecord extends FirestoreRecord {
  FoodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "coverImage" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _coverImage = snapshotData['coverImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Foods');

  static Stream<FoodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodsRecord.fromSnapshot(s));

  static Future<FoodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodsRecord.fromSnapshot(s));

  static FoodsRecord fromSnapshot(DocumentSnapshot snapshot) => FoodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodsRecordData({
  String? name,
  int? quantity,
  String? coverImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'coverImage': coverImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodsRecordDocumentEquality implements Equality<FoodsRecord> {
  const FoodsRecordDocumentEquality();

  @override
  bool equals(FoodsRecord? e1, FoodsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.quantity == e2?.quantity &&
        e1?.coverImage == e2?.coverImage;
  }

  @override
  int hash(FoodsRecord? e) =>
      const ListEquality().hash([e?.name, e?.quantity, e?.coverImage]);

  @override
  bool isValidKey(Object? o) => o is FoodsRecord;
}
