import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/meal_share_action_screen.dart';
import 'package:jestem_glodny/style/constants.dart';

class QuickAccessPanel extends StatelessWidget {
  const QuickAccessPanel({
    super.key,
    required this.size,
    this.color = AppColors.primary1,
    this.mainImagePath,
    this.badgeImagePath = "assets/images/star_pink.png",
    this.title = "",
  });
  final Color color;
  final double size;
  final String? mainImagePath;
  final String? badgeImagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MealShareActionScreen()),
          ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size * 0.05),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          width: size,
          height: size,
          child: Stack(
            children: [
              Positioned(
                right: size * 0.1,
                top: size * 0.1,
                child:
                    badgeImagePath != null
                        ? _badgeImage(badgeImagePath!, size)
                        : const Row(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  mainImagePath != null
                      ? _mainImage(mainImagePath!, size)
                      : const Row(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size * 0.9),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.subWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainImage(String path, double size) => Container(
    width: size * 0.5,
    height: size * 0.5,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  Widget _badgeImage(String path, double size) => Container(
    width: size * 0.1,
    height: size * 0.1,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
