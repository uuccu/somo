import 'package:agile_frontend/util/db/entity/agent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AgentDataProviderService extends ChangeNotifier {
  List<Agent> agents = [];
  AgentDataProviderService();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> loadAgentData() async {
    QuerySnapshot querySnapshot = await firestore.collection('agent').get();
    for (var doc in querySnapshot.docs) {
      Agent agent = Agent.fromDocumentSnapshot(doc);
      // agent.house = await Agent.getHousesFromFirestore(doc.reference);
      agents.add(agent);
    }
    notifyListeners(); // 데이터가 로드된 후에 UI를 업데이트하기 위해 notifyListeners를 호출합니다.
  }
}
