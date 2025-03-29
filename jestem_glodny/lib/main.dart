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
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
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

class GamificationScreen extends StatelessWidget {
  final int currentPoints = 120;
  final int nextTierPoints = 200;

  const GamificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = currentPoints / nextTierPoints;
    int pointsNeeded = nextTierPoints - currentPoints;

    return Scaffold(
      appBar: AppBar(title: Text('Gamifikacja - Food Sharing')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.emoji_events, size: 100, color: Colors.amber),
                SizedBox(height: 20),
                Text(
                  'Twoje Punkty: $currentPoints',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                    Text(
                      '$pointsNeeded pkt',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodListScreen()),
                    );
                  },
                  child: Text('Zdobywaj więcej punktów!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Spaghetti',
      'chef': 'Anna',
      'image': 'assets/spaghetti.png',
      'portions': '3',
    },
    {
      'name': 'Pizza',
      'chef': 'Marco',
      'image': 'assets/pizza.png',
      'portions': '2',
    },
    {
      'name': 'Sushi',
      'chef': 'Kenji',
      'image': 'assets/sushi.png',
      'portions': '5',
    },
  ];

  FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dostępne posiłki')),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return Card(
            child: ListTile(
              leading: Image.asset(food['image']!, width: 50, height: 50),
              title: Text(food['name']!),
              subtitle: Text(
                'Kucharz: ${food['chef']} - Porcje: ${food['portions']}',
              ),
            ),
          );
        },
      ),
    );
  }
}
