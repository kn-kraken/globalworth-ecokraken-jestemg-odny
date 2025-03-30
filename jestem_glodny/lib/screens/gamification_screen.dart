import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/food_list_screen.dart';

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
