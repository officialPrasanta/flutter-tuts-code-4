// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:four/controller/auth_controller.dart';
import 'package:four/model/usermodel.dart';
import 'package:four/view/home.dart';
import 'package:four/view/signup.dart';
import 'package:four/view/userform.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    final User? user = ac.auth.currentUser;
    return user == null
        ? SignUp()
        : FutureBuilder<UserData?>(
            future: ac.fetchUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //dynamic routing
                if (snapshot.hasError) {
                  return SignUp();
                } else {
                  ac.userData.value = snapshot.data!;
                  if (ac.userData.value.name!.isEmpty) {
                    return UserDetails();
                  }else{
                    return Home();
                  }
                }
              } else {
                //splash screen
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            });
  }
}
