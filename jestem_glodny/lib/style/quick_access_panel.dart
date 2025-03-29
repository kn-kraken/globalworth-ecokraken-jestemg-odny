import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class QuickAccessPanel extends StatelessWidget {
  const QuickAccessPanel({
    super.key,
    this.color = AppColors.primary1,
    this.mainImagePath,
    this.badgeImagePath,
  });
  final Color color;
  final String? mainImagePath;
  final String? badgeImagePath;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.3;
    return Container(
      width: size,
      height: size,
      color: color,
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
            children: [
              mainImagePath != null
                  ? _mainImage(mainImagePath!, size)
                  : const Row(),
              Text(""),
            ],
          ),
        ],
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
    width: size * 0.2,
    height: size * 0.2,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
