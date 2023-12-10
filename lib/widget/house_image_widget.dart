import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

class HouseImageWidget extends StatelessWidget {
  const HouseImageWidget({
    super.key,
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FutureBuilder<String>(
        future: FirebaseStorageUtil().getImageUrl(house.imageUrl),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Container(
                width: Screen.designToScreenWidth(context, 430),
                height: Screen.designToScreenHeight(context, 331),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(snapshot.data!),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
          }
        },
      ),
      Positioned(
        top: Screen.designToScreenHeight(context, 40), // 위치를 조절합니다.
        left: Screen.designToScreenWidth(context, 10), // 위치를 조절합니다.
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ]);
  }
}
