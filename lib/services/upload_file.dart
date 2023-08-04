import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadFile(XFile image) async {
  final String namefile = image.path.split("/").last;
  Reference ref = storage.ref().child("images").child(namefile);

  final UploadTask uploadtask = ref.putFile(image as File);
  print(uploadtask);

  final TaskSnapshot snapshot = await uploadtask.whenComplete(() => true);
  print(snapshot);

  final String url = await snapshot.ref.getDownloadURL();
  print(url);

  return snapshot.state == TaskState.success ? true : false;
}
