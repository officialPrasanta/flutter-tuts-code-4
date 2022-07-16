// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:four/controller/auth_controller.dart';
import 'package:get/get.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.put(AuthController());
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
                    'OTP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    // focusNode: ac.focus,
                    controller: ac.smsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Your OTP.',
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
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: ac.submit,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
