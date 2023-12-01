import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FirebaseFireStore {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseFireStore();

  Future<String> uploadImage(String path, String imagePath) async {
    ByteData byteData = await rootBundle.load(imagePath);
    String fileName = imagePath.split('/')[3].split('.')[0];
    Directory tempDir = Directory.systemTemp;

    File file = File('${tempDir.path}/$fileName.png');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    String ref = "$path/$fileName";
    _storage.ref(ref).putFile(file);
    return ref;
  }

  Future<void> initData() async {
    List<String> uploadedImageRefs = [];

    List<String> imagePath = [
      'asset/image/agent_init_data/CHOLONGLEE.png',
      'asset/image/agent_init_data/HANDSOMEGUY.png',
      'asset/image/agent_init_data/MULBA.png',
      'asset/image/agent_init_data/INMAKAO.png',
    ];
    String housePath = 'asset/image/house/pic.png';

    await FirebaseFirestore.instance
        .runTransaction((Transaction transaction) async {
      String houseRef = await uploadImage('house', housePath);
      uploadedImageRefs.add(houseRef);

      for (int i = 0; i < imagePath.length; i++) {
        String ref = await uploadImage('agent', imagePath[i]);
        uploadedImageRefs.add(ref);
        DocumentReference reference = _firestore.collection('agent').doc();

        transaction.set(reference, {
          'id': '1',
          'email': 'zxcv@zxcv.com',
          'name': imagePath[i].split('/')[3].split('.')[0],
          'photoUrl': ref,
          'role': i % 2 == 0 ? 'broker' : 'owner',
          'address': 'Phnom Penh',
          'phone':
              '010-${Random().nextInt(999999)}-${Random().nextInt(999999)}',
        });

        DocumentReference houseReference = reference.collection('house').doc();
        transaction.set(
          houseReference,
          {
            'id': '1',
            'name': 'House ${i + 1}',
            'imageUrl': houseRef,
            'address': 'Phnom Penh',
            'size': Random().nextInt(1000).toDouble(),
            'price': '${Random().nextInt(1000)}\$',
            'floor': '${Random().nextInt(100)}',
            'room': Random().nextInt(10),
            'bathroom': Random().nextInt(10),
            'direction': 'North',
            'park': Random().nextInt(10),
            'occupancyDate': '2021-10-10',
            'completionDate': DateTime.now(),
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.',
            'rule':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.',
          },
        );
      }
    });
  }
}

// class Agent {
//   String id;
//   String email;
//   String name;
//   String photoUrl;
//   String role;
//   String address;
//   String phone;
//   // sub collections Houseinformation
//   House house;

//   Agent({
//     required this.id,
//     required this.email,
//     required this.name,
//     required this.photoUrl,
//     required this.role,
//     required this.address,
//     required this.phone,
//     required this.house,
//   });
// }

// class House {
//   String id;
//   String name;
//   String imageUrl;
//   String address;
//   double size;
//   String price;
//   String floor;
//   int room;
//   int bathroom;
//   String direction;
//   int park;
//   String occupancyDate;
//   DateTime completionDate;
//   String description;
//   String rule;

//   House(
//       {required this.id,
//       required this.name,
//       required this.imageUrl,
//       required this.address,
//       required this.size,
//       required this.price,
//       required this.floor,
//       required this.room,
//       required this.bathroom,
//       required this.direction,
//       required this.park,
//       required this.occupancyDate,
//       required this.completionDate,
//       required this.description,
//       required this.rule});
// }
