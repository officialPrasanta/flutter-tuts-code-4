// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:four/controller/userdetails_controller.dart';
import 'package:four/view/compenents/bbutton.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsController udc = Get.put(UserDetailsController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 48,
          bottom: 16,
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'User Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: udc.nameController,
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: udc.ageController,
                  decoration: InputDecoration(
                    hintText: 'Your Age',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bttomButton(udc.updateUser, 'Update User')
        ]),
      ),
    );
  }
}
