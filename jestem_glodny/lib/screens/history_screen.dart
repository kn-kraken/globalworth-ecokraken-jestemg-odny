import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyEntries = [
      HistoryEntry(
        "Resztki pizzy",
        "Podzieliłeś się 3 porcjami",
        Category.foodSharing,
      ),
      HistoryEntry(
        "Zestaw-combo sushi",
        "Zamówiłeś Ty i 4 Twoich znajomych",
        Category.groupOrdering,
      ),
      HistoryEntry(
        "Włoski obiad",
        "Jadłeś Ty i 2 Twoich znajomych",
        Category.groupEatingOut,
      ),
      HistoryEntry(
        "Zup ogórkówa",
        "Podzieliłeś się 4 porcjami",
        Category.foodSharing,
      ),
      HistoryEntry(
        "Noc burgerów",
        "Zamówiłeś Ty i 3 Twoich znajomych",
        Category.groupOrdering,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historia aktywności"),
        backgroundColor: AppColors.primary1,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: historyEntries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final entry = historyEntries[index];
          return _buildHistoryCard(entry);
        },
      ),
    );
  }

  Widget _buildHistoryCard(HistoryEntry entry) {
    final categoryData = _categoryStyle(entry.category);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: categoryData['color'] as Color,
      elevation: 3,
      child: ListTile(
        leading: Icon(
          categoryData['icon'] as IconData,
          size: 32,
          color: Colors.white,
        ),
        title: Text(
          entry.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          entry.description,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Map<String, dynamic> _categoryStyle(Category category) {
    switch (category) {
      case Category.foodSharing:
        return {
          'color': Colors.green.shade400,
          'icon': Icons.volunteer_activism,
        };
      case Category.groupOrdering:
        return {'color': Colors.orange.shade400, 'icon': Icons.shopping_basket};
      case Category.groupEatingOut:
        return {'color': Colors.blue.shade400, 'icon': Icons.restaurant};
    }
  }
}

enum Category { foodSharing, groupOrdering, groupEatingOut }

class HistoryEntry {
  final String title;
  final String description;
  final Category category;

  HistoryEntry(this.title, this.description, this.category);
}
