part of 'shared.dart';

Future<File> getImage() async {
  // final _picker = ImagePicker();

  var image = await ImagePicker().getImage(source: ImageSource.gallery);

  return File(image.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}
