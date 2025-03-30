import 'package:flutter/material.dart';

class GamificationScreen extends StatelessWidget {
  final int currentPoints = 300;
  final int nextTierPoints = 700;

  const GamificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = currentPoints / nextTierPoints;

    return Center(
      child: Column(
        children: [
          // Keep your two cards here
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, size: 40, color: Colors.amber),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    '$currentPoints/$nextTierPoints',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/images/leaf.png', height: 40, width: 40),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
