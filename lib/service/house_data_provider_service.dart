import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HouseDataProviderService extends ChangeNotifier {
  late DocumentSnapshot<Map<String, dynamic>> _detachedHouseData;
  late DocumentSnapshot<Map<String, dynamic>> _multiplexData;
  late DocumentSnapshot<Map<String, dynamic>> _apartmentData;
  late DocumentSnapshot<Map<String, dynamic>> _oneroomData;

  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> houseList = [
    'detached',
    'multiplex',
    'apartment',
    'one_room'
  ];

  HouseDataProviderService() {
    _init();
  }

  Future<void> _init() async {
    await _loadHouseData();
  }

  Future<void> _loadHouseData() async {
    _detachedHouseData = await _firestore.collection('detached').doc().get();
    _multiplexData = await _firestore.collection('multiplex').doc().get();
    _apartmentData = await _firestore.collection('apartment').doc().get();
    _oneroomData = await _firestore.collection('one_room').doc().get();
  }

  DocumentSnapshot<Map<String, dynamic>> get detachedHouseData =>
      _detachedHouseData;
  DocumentSnapshot<Map<String, dynamic>> get multiplexData => _multiplexData;

  DocumentSnapshot<Map<String, dynamic>> get apartmentData => _apartmentData;

  DocumentSnapshot<Map<String, dynamic>> get oneroomData => _oneroomData;

  // late final CollectionReference _collectionRef = // test succuess
  //     _firestore.collection('detached');

  // void addData() async {
  //   final DocumentReference documentRef = _collectionRef.doc('');

  //   final DocumentSnapshot documentSnapshot = await documentRef.get();

  //   if (!documentSnapshot.exists) {
  //     // 문서가 없는 경우에만 데이터를 생성합니다.
  //     documentRef.set({
  //       'title': 'Mastering Flutter',
  //       'description': 'Programming Guide for Dart',
  //     });
  //   } else {
  //     print('Document already exists.');
  //   }
  // }

  // Future<void> _saveHouseData() async {}

  // Future<void> _deleteHouseData() async {}

  // Future<void> _updateHouseData() async {}
}
