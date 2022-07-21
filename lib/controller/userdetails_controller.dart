import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:four/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class UserDetailsController extends GetxController {
  AuthController ac = AuthController();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void updateUser() async {
    await ac.firebase.collection('users').doc(ac.auth.currentUser!.uid).set({
      'name': nameController.text,
      'age': ageController.text,
    }, SetOptions(merge: true));

    Get.offAllNamed('HOME');
  }
}
