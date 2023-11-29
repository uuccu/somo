import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HouseDataProviderService extends ChangeNotifier {
  late DocumentSnapshot<Map<String, dynamic>> _detachedHouseData;
  late DocumentSnapshot<Map<String, dynamic>> _multiplexData;
  late DocumentSnapshot<Map<String, dynamic>> _apartmentData;
  late DocumentSnapshot<Map<String, dynamic>> _one_roomData;

  HouseDataProviderService() {
    _init();
  }

  Future<void> _init() async {
    await _loadHouseData();
  }

  Future<void> _loadHouseData() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    _detachedHouseData = await _firestore.collection('detached').doc().get();
    _multiplexData = await _firestore.collection('multiplex').doc().get();
    _apartmentData = await _firestore.collection('apartment').doc().get();
    _one_roomData = await _firestore.collection('one_room').doc().get();
  }

  DocumentSnapshot<Map<String, dynamic>> get detachedHouseData =>
      _detachedHouseData;
  DocumentSnapshot<Map<String, dynamic>> get multiplexData => _multiplexData;

  DocumentSnapshot<Map<String, dynamic>> get apartmentData => _apartmentData;

  DocumentSnapshot<Map<String, dynamic>> get one_roomData => _one_roomData;

  // Future<void> _saveHouseData() async {}

  // Future<void> _deleteHouseData() async {}

  // Future<void> _updateHouseData() async {}
}
