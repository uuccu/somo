import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String gender;
  String name;
  String email;
  String phone;
  String photoUrl;
  String age;
  String job;
  String preferenceArea1;
  String preferenceArea2;
  double preferenceMinPrice;
  double preferenceMaxPrice;
  String preferenceSize;
  double trustedWeight;

  User({
    required this.id,
    required this.gender,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.age,
    required this.job,
    required this.preferenceArea1,
    required this.preferenceArea2,
    required this.preferenceMinPrice,
    required this.preferenceMaxPrice,
    required this.preferenceSize,
    required this.trustedWeight,
  });

  factory User.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) => User(
        id: documentSnapshot['id'],
        gender: documentSnapshot['gender'],
        name: documentSnapshot['name'],
        email: documentSnapshot['email'],
        phone: documentSnapshot['phone'],
        photoUrl: documentSnapshot['photoUrl'],
        age: documentSnapshot['age'],
        job: documentSnapshot['job'],
        preferenceArea1: documentSnapshot['preferenceArea1'],
        preferenceArea2: documentSnapshot['preferenceArea2'],
        preferenceMinPrice: documentSnapshot['preferenceMinPrice'],
        preferenceMaxPrice: documentSnapshot['preferenceMaxPrice'],
        preferenceSize: documentSnapshot['preferenceSize'],
        trustedWeight: documentSnapshot['trustedWeight'],
      );
}
