import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class PointsInfoPopupScreen extends StatelessWidget {
  const PointsInfoPopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Reguły grywalizacji",
            style: AppStyles.mainBold,
            textAlign: TextAlign.center,
          ),
          Text(
            "Przygotuj posiłek dla współpracowników, aby otrzymać tokeny-rameny.",
            style: AppStyles.regular,
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/ramen.png', width: 40, height: 40),
          Text(
            "Za udział w food sharingu, wspólne zamawianie jedzenia i lunche otrzymasz liście, które wymienisz na nagrody u swojego pracodawcy.",
            style: AppStyles.regular,
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/leaf.png', width: 40, height: 40),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.background2,
              backgroundColor: AppColors.primary1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Rozumiem"),
          ),
        ],
      ),
    );
  }
}
