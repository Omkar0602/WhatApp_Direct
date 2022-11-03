import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wa_flutter/appOpenAdManager.dart';
import 'package:wa_flutter/main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  
  @override
  void initState() {
    super.initState();

    //Load AppOpen Ad

    //Show AppOpen Ad After 8 Seconds
    Future.delayed(const Duration(milliseconds: 800)).then((value) async{
      //Here we will wait for 8 seconds to load our ad
      //After 8 second it will go to HomePage
     await  loadadd();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyClass(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}