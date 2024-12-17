import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgbb/imgbb.dart';

class Settingsprovider  extends ChangeNotifier{
  File? _image;
  File? get image => _image;

  String? _networkImage;
  String? get networkImage => _networkImage;


  // Implementing the image picker
  Future<void> openImagePicker() async {
    // This is the image picker
  final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
    }
    if(_image !=null) {
      addImageLink();

    }
  }

  //for update the profile image
  void addImageLink() async {
    //convert file into network link
    final uploader = Imgbb('0fe0a27e1b088553d514cf8ad05bd957');
    var res = await uploader.uploadImageFile(
        imageFile: _image!,
        name:'cat',
        expiration: 600);
        print(res!.displayUrl);
     final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
     print('dsvjndnjsc cx');
    await firebaseAuth.currentUser?.updatePhotoURL(res.displayUrl); 
    _networkImage =  FirebaseAuth.instance.currentUser!.photoURL!; 
    notifyListeners();
  }

  //for starting time _network Image is null so we assign the firebase profile link to the netwrok image
  void startSettings() {
    _networkImage = FirebaseAuth.instance.currentUser!.photoURL;
  }
  
}