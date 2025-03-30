import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/eat_out.dart';
import 'package:jestem_glodny/screens/gamification_screen.dart';
import 'package:jestem_glodny/screens/meal_share_action_screen.dart';
import 'package:jestem_glodny/screens/order_screen.dart';
import 'package:jestem_glodny/screens/points_info_popup_screen.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/widgets/food_option.dart';

class DailyCateringInfo extends StatelessWidget {
  const DailyCateringInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.restaurant_menu, color: AppColors.primary1),
              SizedBox(width: 8),
              Text(
                'Dzisiejszy catering: Ślimak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Menu dnia:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text1,
            ),
          ),
          SizedBox(height: 8),
          _buildMenuItem('Zupa pomidorowa z makaronem'),
          _buildMenuItem('Kotlet schabowy z ziemniakami'),
          _buildMenuItem('Surówka z marchewki'),
          _buildMenuItem('Kompot owocowy'),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: AppColors.text2),
              SizedBox(width: 4),
              Text(
                'Wydawanie: 12:00 - 12:10',
                style: TextStyle(color: AppColors.text2, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.chevron_right, size: 20, color: AppColors.primary1),
          SizedBox(width: 4),
          Text(item, style: TextStyle(fontSize: 15, color: AppColors.text1)),
        ],
      ),
    );
  }
}

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
            DailyCateringInfo(), // Dodany widget cateringu
            SizedBox(height: 20),
            FoodOption(
              title: 'Food Sharing',
              image: 'assets/images/food_sharing.png',
              targetScreen: MealShareActionScreen(),
            ),
            FoodOption(
              title: 'Order',
              image: 'assets/images/order.png',
              targetScreen: OrderScreen(),
            ),
            FoodOption(
              title: 'Eat Out',
              image: 'assets/images/eat_out.png',
              targetScreen: LunchListWidget(),
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
