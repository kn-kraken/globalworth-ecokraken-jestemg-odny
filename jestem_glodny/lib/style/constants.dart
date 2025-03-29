import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary1 = Color(0xFFBB142E);
  static const Color primary2 = Color(0xFFC72035);

  static const Color background1 = Color(0xFFEBEBEB);
  static const Color background2 = Color(0xFFFCFCFC);

  static const Color text1 = Color(0xFF1E1E1E);
  static const Color text2 = Color(0xFF4B4B4B);
}

class AppStyles {
  AppStyles._();
  static const TextStyle mainBold = TextStyle(
    color: AppColors.text1,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
}
