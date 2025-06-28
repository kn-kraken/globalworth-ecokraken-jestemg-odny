import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/eat_out.dart';
import 'package:jestem_glodny/screens/gamification_screen.dart';
import 'package:jestem_glodny/screens/meal_share_action_screen.dart';
import 'package:jestem_glodny/screens/order_screen.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/widgets/food_option.dart';

class FoodActionScreen extends StatelessWidget {
  const FoodActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.text1),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Organizacja jedzenia',
            style: AppStyles.mainBold.copyWith(
              fontSize: 20,
              color: AppColors.text1,
            ),
          ),
          backgroundColor: AppColors.primary1,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.text1),
        ),
        backgroundColor: AppColors.background1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GamificationScreen(),
              SizedBox(height: 20),
              FoodOption(
                title: 'Jadłodzielenie',
                image: 'assets/images/food_sharing.png',
                targetScreen: MealShareActionScreen(),
              ),
              FoodOption(
                title: 'Zamówienie grupowe',
                image: 'assets/images/order.png',
                targetScreen: OrderScreen(),
              ),
              FoodOption(
                title: 'Wyjście na lunch',
                image: 'assets/images/eat_out.png',
                targetScreen: LunchListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
