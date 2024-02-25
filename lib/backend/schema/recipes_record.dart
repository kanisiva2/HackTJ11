import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "coverImage" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  // "vegan" field.
  bool? _vegan;
  bool get vegan => _vegan ?? false;
  bool hasVegan() => _vegan != null;

  // "vegetarian" field.
  bool? _vegetarian;
  bool get vegetarian => _vegetarian ?? false;
  bool hasVegetarian() => _vegetarian != null;

  // "glutenfree" field.
  bool? _glutenfree;
  bool get glutenfree => _glutenfree ?? false;
  bool hasGlutenfree() => _glutenfree != null;

  // "nutfree" field.
  bool? _nutfree;
  bool get nutfree => _nutfree ?? false;
  bool hasNutfree() => _nutfree != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "Calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _coverImage = snapshotData['coverImage'] as String?;
    _vegan = snapshotData['vegan'] as bool?;
    _vegetarian = snapshotData['vegetarian'] as bool?;
    _glutenfree = snapshotData['glutenfree'] as bool?;
    _nutfree = snapshotData['nutfree'] as bool?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _calories = castToType<int>(snapshotData['Calories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  String? coverImage,
  bool? vegan,
  bool? vegetarian,
  bool? glutenfree,
  bool? nutfree,
  int? calories,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'coverImage': coverImage,
      'vegan': vegan,
      'vegetarian': vegetarian,
      'glutenfree': glutenfree,
      'nutfree': nutfree,
      'Calories': calories,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.coverImage == e2?.coverImage &&
        e1?.vegan == e2?.vegan &&
        e1?.vegetarian == e2?.vegetarian &&
        e1?.glutenfree == e2?.glutenfree &&
        e1?.nutfree == e2?.nutfree &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.calories == e2?.calories;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.coverImage,
        e?.vegan,
        e?.vegetarian,
        e?.glutenfree,
        e?.nutfree,
        e?.ingredients,
        e?.calories
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
