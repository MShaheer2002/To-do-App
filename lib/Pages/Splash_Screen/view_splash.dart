import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset("assets/animations/Flow1.json",repeat: false),
    );
  }
}
