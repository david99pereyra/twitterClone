import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UtilsService {
  Future<String> uploadFile(File image, String path) async {

    Uint8List imageBytes = await image.readAsBytes();

    firebase_storage.Reference storageReference =
        firebase_storage.FirebaseStorage.instance.ref(path);

    firebase_storage.UploadTask uploadTask = storageReference.putData(imageBytes);

    await uploadTask.whenComplete(() => null);
/*
    String returnUrl = '';
    await storageReference.getDownloadURL().then((fileURL) {
      returnUrl = fileURL;
    });
    */
    return await storageReference.getDownloadURL();
  }
}
