// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:four/controller/auth_controller.dart';
import 'package:four/view/compenents/bbutton.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 42,
          bottom: 16,
        ),
        child: Stack(
          children: [
            Align(
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    focusNode: ac.focus,
                    controller: ac.phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Phone No.',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 16,
                        bottom: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            bttomButton(ac.signup, 'Sign Up')
          ],
        ),
      ),
    );
  }
}
