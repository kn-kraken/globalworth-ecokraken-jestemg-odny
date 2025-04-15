import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

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
                'Pobliski catering: Ślimak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1,
                ),
              ),
              Spacer(),
              Image.asset('assets/images/leaf.png', height: 24, width: 24),
              Text('× 10', style: TextStyle(color: AppColors.text1)),
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
