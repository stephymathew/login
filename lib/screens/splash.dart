import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/flower.jpg',
          height: 300,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool islogin = pref.getBool('islogin') ?? false;
    Timer(const Duration(seconds: 3), () {
      if (islogin) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenHome(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenLogin(),
            ));
      }
    });

    // Future.delayed(Duration(seconds: 3));
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
    //   return ScreenLogin();
    // }
    // )
    // );
  }
}
