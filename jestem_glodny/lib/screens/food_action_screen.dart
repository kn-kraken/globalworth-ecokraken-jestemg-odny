import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/detail_screen.dart';
import 'package:jestem_glodny/screens/gamification_screen.dart';
import 'package:jestem_glodny/screens/meal_share_action_screen.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/widgets/food_option.dart';

class FoodActionScreen extends StatelessWidget {
  const FoodActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.text1),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Jestem Głodnx!', style: TextStyle(color: AppColors.text1)),
        backgroundColor: Colors.grey[200],
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
              title: 'Food Sharing',
              image: 'assets/images/food_sharing.png',
              targetScreen: MealShareActionScreen(),
            ),
            FoodOption(
              title: 'Order',
              image: 'assets/images/order.png',
              targetScreen: DetailScreen(title: 'Order'),
            ),
            FoodOption(
              title: 'Eat Out',
              image: 'assets/images/eat_out.png',
              targetScreen: DetailScreen(title: 'Eat Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.background2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, size: 30),
              label: 'Pulpit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: 'Zarządzaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, size: 30),
              label: 'Historia',
            ),
          ],
          selectedItemColor: AppColors.primary1,
          unselectedItemColor: AppColors.text2,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
