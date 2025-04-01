import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/main_screen.dart';
import 'package:jestem_glodny/style/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background1),
      debugShowCheckedModeBanner: false,
    );
  }
}
