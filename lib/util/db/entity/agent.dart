import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Agent {
  String id;
  String email;
  String name;
  String photoUrl;
  String role;
  String address;
  String phone;
  // sub collections Houseinformation
  List<House> house;

  Agent({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.role,
    required this.address,
    required this.phone,
    required this.house,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      role: json['role'],
      address: json['address'],
      phone: json['phone'],
      house: json['house'].map((house) => House.fromJson(house)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'photoUrl': photoUrl,
        'role': role,
        'address': address,
        'phone': phone,
        'house': house.map((house) => house.toJson()).toList(),
      };

  factory Agent.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Agent(
        id: documentSnapshot['id'],
        email: documentSnapshot['email'],
        name: documentSnapshot['name'],
        photoUrl: documentSnapshot['photoUrl'],
        role: documentSnapshot['role'],
        address: documentSnapshot['address'],
        phone: documentSnapshot['phone'],
        house: []);
  }

  static Future<List<House>> getHousesFromFirestore(
      DocumentReference agentRef) async {
    QuerySnapshot houseSnapshot = await agentRef.collection('house').get();
    var s = houseSnapshot.docs
        .map((house) => House.fromDocumentSnapshot(house))
        .toList();
    return s;
  }
}
