// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text('Hi'),
      ),
    ));
  }
}
