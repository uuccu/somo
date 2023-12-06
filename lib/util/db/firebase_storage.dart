import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageUtil {
  Future<String> getImageUrl(String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    final url = await ref.getDownloadURL();
    return url;
  }
}
