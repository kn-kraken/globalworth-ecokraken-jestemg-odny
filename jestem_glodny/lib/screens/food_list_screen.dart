import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Spaghetti',
      'chef': 'Anna',
      'image': 'assets/images/spaghetti.png',
      'portions': '3',
    },
    {
      'name': 'Pizza',
      'chef': 'Marco',
      'image': 'assets/images/pizza.png',
      'portions': '2',
    },
    {
      'name': 'Sushi',
      'chef': 'Kenji',
      'image': 'assets/images/sushi.png',
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
