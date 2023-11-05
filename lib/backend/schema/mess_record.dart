import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessRecord extends FirestoreRecord {
  MessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "order_no" field.
  int? _orderNo;
  int get orderNo => _orderNo ?? 0;
  bool hasOrderNo() => _orderNo != null;

  // "messname" field.
  String? _messname;
  String get messname => _messname ?? '';
  bool hasMessname() => _messname != null;

  // "breakfast" field.
  String? _breakfast;
  String get breakfast => _breakfast ?? '';
  bool hasBreakfast() => _breakfast != null;

  // "lunch" field.
  String? _lunch;
  String get lunch => _lunch ?? '';
  bool hasLunch() => _lunch != null;

  // "snacks" field.
  String? _snacks;
  String get snacks => _snacks ?? '';
  bool hasSnacks() => _snacks != null;

  // "dinner" field.
  String? _dinner;
  String get dinner => _dinner ?? '';
  bool hasDinner() => _dinner != null;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _orderNo = castToType<int>(snapshotData['order_no']);
    _messname = snapshotData['messname'] as String?;
    _breakfast = snapshotData['breakfast'] as String?;
    _lunch = snapshotData['lunch'] as String?;
    _snacks = snapshotData['snacks'] as String?;
    _dinner = snapshotData['dinner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mess');

  static Stream<MessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessRecord.fromSnapshot(s));

  static Future<MessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessRecord.fromSnapshot(s));

  static MessRecord fromSnapshot(DocumentSnapshot snapshot) => MessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessRecordData({
  String? day,
  int? orderNo,
  String? messname,
  String? breakfast,
  String? lunch,
  String? snacks,
  String? dinner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'order_no': orderNo,
      'messname': messname,
      'breakfast': breakfast,
      'lunch': lunch,
      'snacks': snacks,
      'dinner': dinner,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessRecordDocumentEquality implements Equality<MessRecord> {
  const MessRecordDocumentEquality();

  @override
  bool equals(MessRecord? e1, MessRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.orderNo == e2?.orderNo &&
        e1?.messname == e2?.messname &&
        e1?.breakfast == e2?.breakfast &&
        e1?.lunch == e2?.lunch &&
        e1?.snacks == e2?.snacks &&
        e1?.dinner == e2?.dinner;
  }

  @override
  int hash(MessRecord? e) => const ListEquality().hash([
        e?.day,
        e?.orderNo,
        e?.messname,
        e?.breakfast,
        e?.lunch,
        e?.snacks,
        e?.dinner
      ]);

  @override
  bool isValidKey(Object? o) => o is MessRecord;
}
