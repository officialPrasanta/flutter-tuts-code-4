import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:four/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class UserDetailsController extends GetxController {
  AuthController ac = Get.find<AuthController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void updateUser() async {
    await ac.firebase.collection('users').doc(ac.auth.currentUser!.uid).set({
      'name': nameController.text,
      'age': int.parse(ageController.text),
    }, SetOptions(merge: true));

    //for app
    ac.userData.update((val) {
      val!.name = nameController.text;
      val.age = int.parse(ageController.text);
    });

    Get.offAllNamed('HOME');
  }
}
