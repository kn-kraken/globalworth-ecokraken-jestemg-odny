import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/food_action_screen.dart';

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
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jestem Głodny', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: AppColors.background1,

      body: Column(
        children: [
          Expanded(
            child: FoodOption(
              title: 'Food Sharing',
              image: 'assets/food_sharing.png',
              targetScreen: GamificationScreen(),
            ),
          ),
          Expanded(
            child: FoodOption(
              title: 'Order',
              image: 'assets/order.png',
              targetScreen: DetailScreen(title: 'Order'),
            ),
          ),
          Expanded(
            child: FoodOption(
              title: 'Eat Out',
              image: 'assets/eat_out.png',
              targetScreen: DetailScreen(title: 'Eat Out'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
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
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

class FoodOption extends StatelessWidget {
  final String title;
  final String image;
  final Widget targetScreen;

  const FoodOption({
    super.key,
    required this.title,
    required this.image,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Image.asset(image, width: 60, height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Szczegóły dla $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
