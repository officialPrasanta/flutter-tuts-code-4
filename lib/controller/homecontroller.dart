import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four/const/comm_const.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  //variables
  final ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  XFile? pickedFile;
  Rx<String> url = defaultImage.obs;

  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  //method
  void loadPicker() async {
    EasyLoading.show(status: 'Loading...');
    try {
      pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        String fileExtension = pickedFile!.path.split('.').last; //extension
        String imagePath = pickedFile!.path.split('.').first; //name

        uploadFirebaseStorage(File(pickedFile!.path), imagePath, fileExtension);
      }
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  void uploadFirebaseStorage(
      File image, String imagePath, String fileExtension) async {
    var snapshot = await storage
        .ref('/productImage')
        .child('$imagePath.$fileExtension')
        .putFile(image);

    url.value = await snapshot.ref.getDownloadURL();
  }

  void clearForm() {
    productNameController.clear();
    priceController.clear();
    qtyController.clear();
    url.value = defaultImage;
  }

  void submitProduct() async {
    await firestore.collection('products').doc().set({
      "productName": productNameController.text,
      "price": int.parse(priceController.text),
      "qty": int.parse(qtyController.text),
      "productUrl": url.value
    }, SetOptions(merge: true));

    clearForm();
    Fluttertoast.showToast(msg: 'Submission successful');
  }

  Query queryFx() {
    return firestore.collection('data');
  }
}
