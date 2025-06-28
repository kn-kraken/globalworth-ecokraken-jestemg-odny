import 'package:flutter/material.dart';
import 'package:jestem_glodny/screens/food_action_screen.dart';
import 'package:jestem_glodny/screens/history_screen.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/style/daily_catering_info.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgt.png"),
            repeat: ImageRepeat.repeat,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 255, 238, 233),
              BlendMode.srcIn,
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'HunGRY',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary1,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "👋 Witaj, na co masz dziś ochotę?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Start Sharing Button
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FoodActionScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.fastfood,
                            size: 48,
                            color: AppColors.primary1,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Zjedz coś",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Wybierz Swój Styl: Podziel Się, Zamów Razem lub Wyjdź Wspólnie z Innymi!",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.text2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                DailyCateringInfo(), // Dodany widget cateringu
                SizedBox(height: 16),

                // History Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primary1,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: AppColors.primary2, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: const Icon(Icons.history),
                  label: const Text(
                    "Zobacz historię",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
