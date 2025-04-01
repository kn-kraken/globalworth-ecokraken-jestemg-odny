import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';
import 'package:jestem_glodny/style/quick_access_panel.dart';
import 'package:jestem_glodny/widgets/event_widget.dart';
import 'package:jestem_glodny/widgets/key_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: AppColors.background1,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cześć, miło Cię widzieć", style: AppStyles.mainBold),
              Text("Pulpit", style: AppStyles.mainSub),
              SizedBox(height: 30),
              Text("W pobliżu", style: AppStyles.mainBold),
              KeyUnlocker(),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Pęk kluczy (8)", style: AppStyles.mainPink),
              ),
              Text("Szybki dostęp", style: AppStyles.mainBold),
              _eventSideScroller(),
              _premiumFunctions(),
              Text("News", style: AppStyles.mainBold),
              _eventDisplay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _premiumFunctions() => Row(
    children: [
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/star_gray.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      Text("Funkcje premium"),
    ],
  );

  Widget _eventSideScroller() => SizedBox(
    height: 100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          QuickAccessPanel(
            size: 100,
            title: "HunGRY",
            mainImagePath: "assets/images/plate.png",
          ),
          QuickAccessPanel(
            size: 100,
            title: "Miejsca parkingowe",
            mainImagePath: "assets/images/parking.png",
          ),
          QuickAccessPanel(
            size: 100,
            title: "Sale konferencyjne",
            mainImagePath: "assets/images/conference.png",
          ),
          QuickAccessPanel(
            size: 100,
            title: "Biurka",
            mainImagePath: "assets/images/desktops.png",
          ),
        ],
      ),
    ),
  );

  Widget _eventDisplay() {
    return EventWidget();
  }
}
