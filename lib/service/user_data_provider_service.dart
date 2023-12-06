import 'package:agile_frontend/util/db/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserDataProviderService extends ChangeNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<User> users = [];

  UserDataProviderService();

  Future<void> loadUserData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('user').get();

    for (var doc in querySnapshot.docs) {
      User user = User.fromDocumentSnapshot(doc);
      users.add(user);
    }

    notifyListeners();
  }
}
