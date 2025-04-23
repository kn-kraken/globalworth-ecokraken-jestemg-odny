import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffdf8f2),
      child: Center(
        child: Image.asset('assets/images/logo.png', width: 300, height: 300),
      ),
    );
  }
}
