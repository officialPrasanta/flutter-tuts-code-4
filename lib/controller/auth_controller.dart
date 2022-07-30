import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four/model/usermodel.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthController extends GetxController {
  //variables
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController smsController = TextEditingController();
  FocusNode focus = FocusNode();
  SmsAutoFill autofill = SmsAutoFill();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  Rx<String> verificationID = ''.obs;
  UserCredential? authResult;

  Rx<UserData> userData = UserData().obs;

  //methods

  Future<UserData?> fetchUserData() async {
    DocumentSnapshot<Map<String, dynamic>> userInfo =
        await firebase.collection('users').doc(auth.currentUser!.uid).get();

    if (userInfo.exists) {
      userData.value = UserData.fromJson(userInfo.data()!);
    }
    return userData.value;
  }

  void _autofillNo() async {
    phoneNumberController.text = await autofill.hint ?? '';
  }

  @override
  void onInit() {
    focus.addListener(_autofillNo);
    super.onInit();
  }

  @override
  void onClose() {
    focus.removeListener(_autofillNo);
    super.onClose();
  }

  String phoneNo = '';

  void signup() {
    if (phoneNumberController.text.length <= 10) {
      phoneNo = '+91${phoneNumberController.text}';
    } else {
      phoneNo = phoneNumberController.text;
    }

    if (phoneNo.length == 13) {
      // print("phone No: ${phoneNo}");
      verifyPhone(phoneNo);
    } else {
      Fluttertoast.showToast(msg: 'Phone No Should be 10 digit no.');
    }
  }

  Future<void> verifyPhone(String phoneNo) async {
    try {
      EasyLoading.show(status: 'Verifying ....');
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted: (PhoneAuthCredential credential) {
            Fluttertoast.showToast(msg: 'verification completed');
          },
          verificationFailed: (FirebaseAuthException e) {
            Fluttertoast.showToast(msg: 'verification failed');
          },
          codeSent: (String verificationId, int? resendToken) async {
            verificationID.value = verificationId;
          },
          // timeout: Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {});
      EasyLoading.dismiss();
      focus.removeListener(_autofillNo);
      Get.toNamed("OTP");
    } catch (e) {}
  }

  void submit() async {
    try {
      EasyLoading.show(status: 'submitting....');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID.value, smsCode: smsController.text);

      authResult = await auth.signInWithCredential(credential);

      if (authResult!.additionalUserInfo!.isNewUser) {
        registerTheUser();
      } else {
        loginTheUser();
      }
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void registerTheUser() async {
    Timestamp now = Timestamp.now();
    await firebase.collection('users').doc(auth.currentUser!.uid).set(
      {
        'uid': auth.currentUser!.uid,
        'createdAt': now,
      },
      SetOptions(merge: true),
    );

    userData.update((val) {
      val!.uid = auth.currentUser!.uid;
      val.createdAt = now;
    });

    Get.offAllNamed('DETAILS_USER');
  }

  void loginTheUser() async {
    Map<String, dynamic> userDetailsInJson = await firebase
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get() as Map<String, dynamic>;

    userData.value = UserData.fromJson(userDetailsInJson);
    Get.offAllNamed('HOME');
  }
}
