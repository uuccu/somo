import 'package:agile_frontend/util/db/entity/house_review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HouseReviewDataProviderService extends ChangeNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<HouseReview> houseReviews = [];

  String houseIdWithBestReview = '';

  void setHouseIdWithBestReview(String houseId) {
    houseIdWithBestReview = houseId;
    notifyListeners();
  }

  HouseReviewDataProviderService();

  List<HouseReview> getHouseReviewsByHouseIdOrderByAgree(String houseId) {
    List<HouseReview> houseReviewsByHouseId = [];
    for (var houseReview in houseReviews) {
      if (houseReview.houseId == houseId) {
        houseReviewsByHouseId.add(houseReview);
      }
    }
    houseReviewsByHouseId
        .sort((a, b) => b.agree.compareTo(a.agree - a.disagree));

    return houseReviews;
  }

  Future<void> loadHouseReviewData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('house_review').get();

    for (var doc in querySnapshot.docs) {
      HouseReview houseReview = HouseReview.fromDocumentSnapshot(doc);
      houseReviews.add(houseReview);
    }

    notifyListeners();
  }

  void addHouseReview(HouseReview houseReview) {
    houseReviews.add(houseReview);
    notifyListeners();
  }

  void removeHouseReview(HouseReview houseReview) {
    houseReviews.remove(houseReview);
    notifyListeners();
  }
}
