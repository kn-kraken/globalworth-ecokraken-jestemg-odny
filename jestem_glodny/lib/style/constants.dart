import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary1 = Color(0xFFBB142E);
  static const Color primary2 = Color(0xFFC72035);
  static const Color primary3 = Color(0xFFBE4454);
  static const Color primary4 = Color(0xFFC96371);

  static const Color background1 = Color(0xFFECECEC);
  static const Color background2 = Color(0xFFFCFCFC);

  static const Color text1 = Color(0xFF1E1E1E);
  static const Color text2 = Color(0xFF4B4B4B);

  static const Color gold = Color(0xFFFFC107);
}

class AppStyles {
  AppStyles._();
  static const TextStyle mainBold = TextStyle(
    color: AppColors.text1,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mainBold2 = TextStyle(
    color: AppColors.text1,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle mainSub = TextStyle(
    color: AppColors.text2,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mainSub2 = TextStyle(
    color: AppColors.text2,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mainPink = TextStyle(
    color: AppColors.primary2,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle subWhite = TextStyle(
    color: AppColors.background2,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle regular = TextStyle(
    color: AppColors.text1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
