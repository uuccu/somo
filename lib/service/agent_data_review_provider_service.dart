import 'package:agile_frontend/util/db/entity/agent_review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AgentReviewDataProviderService extends ChangeNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AgentReviewDataProviderService();

  List<AgentReview> agentReviews = [];

  Future<void> loadAgentReviewData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('agent_review').get();

    for (var doc in querySnapshot.docs) {
      AgentReview agentReview = AgentReview.fromDocumentSnapshot(doc);
      agentReviews.add(agentReview);
    }

    notifyListeners();
  }
}
