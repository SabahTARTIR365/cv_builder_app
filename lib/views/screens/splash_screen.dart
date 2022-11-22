import 'dart:async';
import 'package:cv_builder_app/page2.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(

            children: <Widget>[
              const Divider(
                height:300.0,
                color: Colors.white,
              ),
              Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                width: 200.0,
              ),
              const Divider(
                height: 105.2,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}