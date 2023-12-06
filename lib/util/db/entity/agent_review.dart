import 'package:cloud_firestore/cloud_firestore.dart';

class AgentReview {
  String id;
  String agentId;
  String userId;
  String generalReview;
  String satisfactionReview;
  String dissatisfactionReview;
  String type;
  int agree;
  int disagree;
  double? propertyDiversityRating; // if type is owner than this is null
  double? informationAccessibilityRating; // if type is owner than this is null
  double? customerServiceRating; // if type is owner than this is null
  double? communicationRating; // if type is owner than this is null
  double? facilitiesAndAmenitiesRating; // if type is owner than this is null
  // no time so spagetti code ㅠㅠ

  bool? livingPreference1;
  bool? livingPreference2;
  bool? livingPreference3;
  bool? livingPreference4;
  bool? livingPreference5;

  AgentReview({
    required this.id,
    required this.agentId,
    required this.userId,
    required this.generalReview,
    required this.satisfactionReview,
    required this.dissatisfactionReview,
    required this.type,
    required this.agree,
    required this.disagree,
    required this.propertyDiversityRating,
    required this.informationAccessibilityRating,
    required this.customerServiceRating,
    required this.communicationRating,
    required this.facilitiesAndAmenitiesRating,
  });

  factory AgentReview.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) =>
      AgentReview(
        id: documentSnapshot['id'],
        agentId: documentSnapshot['agentId'],
        userId: documentSnapshot['userId'],
        type: documentSnapshot['type'],
        generalReview: documentSnapshot['generalReview'],
        satisfactionReview: documentSnapshot['satisfactionReview'],
        dissatisfactionReview: documentSnapshot['dissatisfactionReview'],
        agree: documentSnapshot['agree'],
        disagree: documentSnapshot['disagree'],
        propertyDiversityRating: documentSnapshot['propertyDiversityRating'],
        informationAccessibilityRating:
            documentSnapshot['informationAccessibilityRating'],
        customerServiceRating: documentSnapshot['customerServiceRating'],
        communicationRating: documentSnapshot['communicationRating'],
        facilitiesAndAmenitiesRating:
            documentSnapshot['facilitiesAndAmenitiesRating'],
      );
}
