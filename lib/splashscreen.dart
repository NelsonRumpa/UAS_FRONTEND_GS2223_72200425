import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uas_frontend_gs2223_72200425/uas.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key, required this.title});

  final String title;

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (context) => uas(title: 'uas')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 78, 199, 247),
      body: Center(
        child: Image.asset('image/logo.png'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }
}
