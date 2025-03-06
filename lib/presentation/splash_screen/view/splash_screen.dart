import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/presentation/onboarding_screen/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(
        child:Image.asset("assets/images/splash.png",height: 350,width: 300,),
      ),
    );
  }
}
