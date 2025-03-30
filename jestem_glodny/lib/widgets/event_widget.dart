import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Organizatorzy wydarzenia",
                style: AppStyles.mainBold2,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("28.03.2025, 16:27", style: AppStyles.mainSub2),
            ),
            SizedBox(height: 15),
            Image.asset(
              "assets/images/people.png",
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
