import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class KeyUnlocker extends StatelessWidget {
  const KeyUnlocker({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/action.png", width: 45, height: 45),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 0,
                  children: [
                    Text("L11 Holl/wsch.", style: AppStyles.mainBold2),
                    Text("WTT", style: AppStyles.mainSub2),
                  ],
                ),
                Spacer(),
                Image.asset("assets/images/quick_actions.png", width: 60),
              ],
            ),
            SizedBox(height: 15),
            Image.asset("assets/images/unlock.png", width: 80, height: 80),
            Text("Autoryzuj", style: AppStyles.mainSub2),
          ],
        ),
      ),
    );
  }
}
