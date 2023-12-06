import 'package:cloud_firestore/cloud_firestore.dart';

class HouseReview {
  String id;
  String houseId;
  String userId;
  String generalReview;
  String satisfactionReview;
  String dissatisfactionReview;
  int agree;
  int disagree;
  double indoorEnvironmentRating;
  double outdoorEnvironmentRating;
  double communicationWithLandlordRating;
  double similarityToTheProvidedInfoRating;
  double sunlightExposureRating;

  HouseReview({
    required this.id,
    required this.houseId,
    required this.userId,
    required this.generalReview,
    required this.satisfactionReview,
    required this.dissatisfactionReview,
    required this.agree,
    required this.disagree,
    required this.indoorEnvironmentRating,
    required this.outdoorEnvironmentRating,
    required this.communicationWithLandlordRating,
    required this.similarityToTheProvidedInfoRating,
    required this.sunlightExposureRating,
  });

  factory HouseReview.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return HouseReview(
      id: documentSnapshot['id'],
      houseId: documentSnapshot['houseId'],
      userId: documentSnapshot['userId'],
      generalReview: documentSnapshot['generalReview'],
      satisfactionReview: documentSnapshot['satisfactionReview'],
      dissatisfactionReview: documentSnapshot['dissatisfactionReview'],
      agree: documentSnapshot['agree'],
      disagree: documentSnapshot['disagree'],
      indoorEnvironmentRating: documentSnapshot['indoorEnvironmentRating'],
      outdoorEnvironmentRating: documentSnapshot['outdoorEnvironmentRating'],
      communicationWithLandlordRating:
          documentSnapshot['communicationWithLandlordRating'],
      similarityToTheProvidedInfoRating:
          documentSnapshot['similarityToTheProvidedInfoRating'],
      sunlightExposureRating: documentSnapshot['sunlightExposureRating'],
    );
  }
}
