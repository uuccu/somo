class User {
  String uid;
  String email;
  String name;
  String photoUrl;
  String role;
  String address;
  String phone;
  // sub collections Houseinformation
  House house;

  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.role,
    required this.address,
    required this.phone,
    required this.house,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      role: json['role'],
      address: json['address'],
      phone: json['phone'],
      house: House.fromJson(json['house']),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'photoUrl': photoUrl,
        'role': role,
        'address': address,
        'phone': phone,
        'house': house.toJson(),
      };
}

class House {
  String id;
  String name;
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

  House(
      {required this.id,
      required this.name,
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
      required this.rule});

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      name: json['name'],
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
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
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
      };
}
