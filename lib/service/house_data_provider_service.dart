import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../util/db/entity/house.dart';

class HouseDataProviderService extends ChangeNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<House> houses = [];

  HouseDataProviderService();

  Future<void> loadHouseData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('house').get();
    for (var doc in querySnapshot.docs) {
      House house = House.fromDocumentSnapshot(doc);
      houses.add(house);
    }
    notifyListeners();
  }
}
