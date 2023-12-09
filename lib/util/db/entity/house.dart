import 'package:cloud_firestore/cloud_firestore.dart';

class House {
  String id;
  String agentId;
  String name;
  String type;
  String imageUrl;
  String address;
  double size;
  String price;
  String floor;
  int room;
  int bathroom;
  String direction;
  int park;
  String occupancyDate;
  DateTime completionDate;
  String description;
  String rule;
  GeoPoint location;

  House({
    required this.id,
    required this.agentId,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.address,
    required this.size,
    required this.price,
    required this.floor,
    required this.room,
    required this.bathroom,
    required this.direction,
    required this.park,
    required this.occupancyDate,
    required this.completionDate,
    required this.description,
    required this.rule,
    required this.location,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      agentId: json['agentId'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      address: json['address'],
      size: json['size'],
      price: json['price'],
      floor: json['floor'],
      room: json['room'],
      bathroom: json['bathroom'],
      direction: json['direction'],
      park: json['park'],
      occupancyDate: json['occupancyDate'],
      completionDate: json['completionDate'],
      description: json['description'],
      rule: json['rule'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'agentId': agentId,
        'name': name,
        'type': type,
        'imageUrl': imageUrl,
        'address': address,
        'size': size,
        'price': price,
        'floor': floor,
        'room': room,
        'bathroom': bathroom,
        'direction': direction,
        'park': park,
        'occupancyDate': occupancyDate,
        'completionDate': completionDate,
        'description': description,
        'rule': rule,
        'location': location,
      };

  factory House.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) =>
      House(
        id: documentSnapshot['id'],
        agentId: documentSnapshot['agentId'],
        name: documentSnapshot['name'],
        type: documentSnapshot['type'],
        imageUrl: documentSnapshot['imageUrl'],
        address: documentSnapshot['address'],
        size: documentSnapshot['size'],
        price: documentSnapshot['price'],
        floor: documentSnapshot['floor'],
        room: documentSnapshot['room'],
        bathroom: documentSnapshot['bathroom'],
        direction: documentSnapshot['direction'],
        park: documentSnapshot['park'],
        occupancyDate: documentSnapshot['occupancyDate'],
        completionDate:
            (documentSnapshot['completionDate'] as Timestamp).toDate(),
        description: documentSnapshot['description'],
        rule: documentSnapshot['rule'],
        location: documentSnapshot['location'],
      );
}
