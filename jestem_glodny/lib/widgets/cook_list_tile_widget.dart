import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class CookListTile extends StatelessWidget {
  final String title;
  final String description;
  final int portions;
  final String time;
  final List<String> labels;

  const CookListTile({
    super.key,
    required this.title,
    required this.description,
    required this.portions,
    required this.time,
    this.labels = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors.background2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.text1,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(description, style: TextStyle(color: AppColors.text2)),
            SizedBox(height: 8),
            if (labels.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                children:
                    labels
                        .map(
                          (label) => Chip(
                            label: Text(
                              label,
                              style: TextStyle(
                                color: AppColors.text1,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: AppColors.primary1.withOpacity(
                              0.2,
                            ),
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 8),
            ],
            Row(
              children: [
                Icon(Icons.people, size: 16, color: AppColors.primary1),
                SizedBox(width: 4),
                Text(
                  '$portions portions',
                  style: TextStyle(color: AppColors.text2),
                ),
                Spacer(),
                Icon(Icons.access_time, size: 16, color: AppColors.primary1),
                SizedBox(width: 4),
                Text(time, style: TextStyle(color: AppColors.text2)),
              ],
            ),
          ],
        ),
        onTap: () => Navigator.pop(context), // Dodane cofanie
      ),
    );
  }
}
