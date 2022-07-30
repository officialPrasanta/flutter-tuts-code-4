// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:four/config/instancebinding.dart';
import 'package:four/firebase_options.dart';
import 'package:four/view/home.dart';
import 'package:four/view/otp.dart';
import 'package:four/view/signup.dart';
import 'package:four/view/splash.dart';
import 'package:four/view/userform.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Four',
      initialBinding: InstanceBinding(),
      getPages: [
        GetPage(name: '/SPLASH', page: () => Splash()),
        GetPage(name: '/SIGNUP', page: () => SignUp()),
        GetPage(name: '/OTP', page: () => OTP()),
        GetPage(name: '/HOME', page: () => Home()),
        GetPage(name: '/DETAILS_USER', page: () => UserDetails()),
        // GetPage(name: 'SIGNUP', page: ()=>SignUp()),
      ],
      initialRoute: 'SPLASH',
    );
  }
}
