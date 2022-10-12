import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  Future<Map<String, String>> uploadImageToServer(
      image, String folderName) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    UploadTask task = FirebaseStorage.instance
        .ref()
        .child('$folderName/${DateTime.now().millisecondsSinceEpoch}')
        .putData(await image.readAsBytes());

    final taskSnapshot = await task.whenComplete(() {});

    return {
      'url': await taskSnapshot.ref.getDownloadURL(),
      'fileName': fileName,
    };
  }

  Future<String> uploadImageToChatServer(image) async {
    UploadTask task = FirebaseStorage.instance
        .ref()
        .child('chat/${DateTime.now().millisecondsSinceEpoch}')
        .putData(await image.readAsBytes());

    final taskSnapshot = await task.whenComplete(() {});
    return await taskSnapshot.ref.getDownloadURL();
  }
}