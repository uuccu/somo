import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class InitFireStore {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final FirebaseStorage _storage = FirebaseStorage.instance;

  InitFireStore();

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

  Future<void> initUserData() async {
    List<String> imagePath = [
      'asset/image/user/profile1.png',
      'asset/image/user/profile2.png',
      'asset/image/user/profile3.png',
      'asset/image/user/profile4.png',
      'asset/image/user/profile5.png',
      'asset/image/user/profile6.png',
      'asset/image/user/profile7.png',
      'asset/image/user/profile8.png',
      'asset/image/user/profile9.png',
    ];

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      for (int i = 0; i < imagePath.length; i++) {
        String ref = await uploadImage('user', imagePath[i]);
        DocumentReference reference = _firestore.collection('user').doc();

        transaction.set(reference, {
          'id': '$i',
          'gender': 'male',
          'name': imagePath[i].split('/')[3].split('.')[0],
          'email': 'asfasf@naver.com',
          'phone':
              '010-${Random().nextInt(8999) + 1000}-${Random().nextInt(8999) + 1000}',
          'photoUrl': ref,
          'age': '${Random().nextInt(100)}',
          'job': 'student',
          'preferenceArea1': 'Phnom Penh',
          'preferenceArea2': 'Daun Penh',
          'preferenceMinPrice': Random().nextInt(1000).toDouble(),
          'preferenceMaxPrice': Random().nextInt(1000).toDouble() + 4000,
          'preferenceSize': '33~66',
          'trustedWeight': Random().nextInt(100).toDouble(),
        });
      }
    });
  }

  Future<void> initAgentReviewData() async {
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
    double?
        informationAccessibilityRating; // if type is owner than this is null
    double? customerServiceRating; // if type is owner than this is null
    double? communicationRating; // if type is owner than this is null
    double? facilitiesAndAmenitiesRating; // if type is owner than this is null

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      for (int i = 0; i < 9; i++) {
        id = '$i';
        agentId = '0';
        userId = '$i';
        generalReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        satisfactionReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        dissatisfactionReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        type = 'owner';
        agree = Random().nextInt(100);
        disagree = Random().nextInt(100);
        propertyDiversityRating = Random().nextInt(100).toDouble();
        informationAccessibilityRating = Random().nextInt(100).toDouble();
        customerServiceRating = Random().nextInt(100).toDouble();
        communicationRating = Random().nextInt(100).toDouble();
        facilitiesAndAmenitiesRating = Random().nextInt(100).toDouble();

        DocumentReference reference =
            _firestore.collection('agent_review').doc();

        transaction.set(reference, {
          'id': id,
          'agentId': agentId,
          'userId': userId,
          'generalReview': generalReview,
          'satisfactionReview': satisfactionReview,
          'dissatisfactionReview': dissatisfactionReview,
          'type': type,
          'agree': agree,
          'disagree': disagree,
        });

        transaction.set(reference, {
          'id': id,
          'agentId': agentId,
          'userId': userId,
          'generalReview': generalReview,
          'satisfactionReview': satisfactionReview,
          'dissatisfactionReview': dissatisfactionReview,
          'type': 'broker',
          'agree': agree,
          'disagree': disagree,
          'propertyDiversityRating': propertyDiversityRating,
          'informationAccessibilityRating': informationAccessibilityRating,
          'customerServiceRating': customerServiceRating,
          'communicationRating': communicationRating,
          'facilitiesAndAmenitiesRating': facilitiesAndAmenitiesRating,
        });
      }
    });
  }

  Future<void> initHouseReviewData() async {
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

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      for (int i = 0; i < 9; i++) {
        id = '$i';
        houseId = '0';
        userId = '$i';
        generalReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        satisfactionReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        dissatisfactionReview =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.';
        agree = Random().nextInt(100);
        disagree = Random().nextInt(100);
        indoorEnvironmentRating = Random().nextInt(100).toDouble();
        outdoorEnvironmentRating = Random().nextInt(100).toDouble();
        communicationWithLandlordRating = Random().nextInt(100).toDouble();
        similarityToTheProvidedInfoRating = Random().nextInt(100).toDouble();
        sunlightExposureRating = Random().nextInt(100).toDouble();

        DocumentReference reference =
            _firestore.collection('house_review').doc();

        transaction.set(reference, {
          'id': id,
          'houseId': houseId,
          'userId': userId,
          'generalReview': generalReview,
          'satisfactionReview': satisfactionReview,
          'dissatisfactionReview': dissatisfactionReview,
          'agree': agree,
          'disagree': disagree,
          'indoorEnvironmentRating': indoorEnvironmentRating,
          'outdoorEnvironmentRating': outdoorEnvironmentRating,
          'communicationWithLandlordRating': communicationWithLandlordRating,
          'similarityToTheProvidedInfoRating':
              similarityToTheProvidedInfoRating,
          'sunlightExposureRating': sunlightExposureRating,
        });
      }
    });
  }

  Future<void> initAgentAndHouseData() async {
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

      for (int i = 0; i < imagePath.length; i++) {
        String ref = await uploadImage('agent', imagePath[i]);
        DocumentReference reference = _firestore.collection('agent').doc();

        transaction.set(reference, {
          'id': '$i',
          'email': 'zxcv@zxcv.com',
          'name': imagePath[i].split('/')[3].split('.')[0],
          'photoUrl': ref,
          'role': i % 2 == 0 ? 'broker' : 'owner',
          'address': 'Phnom Penh',
          'phone':
              '010-${Random().nextInt(8999) + 1000}-${Random().nextInt(8999) + 1000}',
        });

        List<String> houseType = [
          'Apartment',
          'Detached',
          'One-room',
          'Multiplex'
        ];

        for (int j = 0; j < 4; j++) {
          DocumentReference houseReference =
              _firestore.collection('house').doc();

          transaction.set(
            houseReference,
            {
              'id': '$j',
              'agentId': reference.id,
              'name': 'House ${Random().nextInt(1000)}',
              'type': houseType[j],
              'imageUrl': houseRef,
              'address': 'Phnom Penh',
              'size': Random().nextInt(1000).toDouble(),
              'price': '${Random().nextInt(1000)}\$',
              'floor': '${Random().nextInt(100)}',
              'room': Random().nextInt(10),
              'bathroom': Random().nextInt(10),
              'direction': 'North',
              'park': Random().nextInt(10),
              'occupancyDate': 'immediate occupancy',
              'completionDate': DateTime.now(),
              'description':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.',
              'rule':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, vitae aliquam nisl nisl vitae nisl.',
            },
          );
        }
      }
    });
  }
}
