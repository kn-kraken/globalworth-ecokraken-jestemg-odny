import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class EatListTile extends StatelessWidget {
  final String title;
  final String date;
  final String author;
  final int quantity;
  final String type;
  // Add description parameter
  final String description;

  const EatListTile({
    super.key,
    required this.title,
    required this.date,
    required this.author,
    required this.quantity,
    required this.type,
    this.description = '', // Default empty description
  });

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.background2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title, style: AppStyles.mainBold),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                // Add eating logic here if needed
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Zjedz ', style: TextStyle(color: AppColors.text1)),
                  Image.asset('assets/meat.png', width: 24, height: 24),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Wróć', style: TextStyle(color: AppColors.text1)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDetailsDialog(context),
      child: Card(
        // Rest of the existing Card widget code remains the same
        elevation: 2,
        color: AppColors.background2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/salad.png', width: 40, height: 40),
              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.mainBold.copyWith(fontSize: 18),
                    ),
                    Text(
                      "$date  $author",
                      style: TextStyle(fontSize: 14, color: AppColors.text2),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.background1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(fontSize: 12, color: AppColors.text2),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text(
                    "$quantity × ",
                    style: AppStyles.mainBold.copyWith(fontSize: 18),
                  ),
                  Image.asset('assets/meat.png', width: 24, height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
