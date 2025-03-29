import 'package:flutter/material.dart';
import 'package:jestem_glodny/style/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(title)),
      drawer: Drawer(),
      body: Column(
        children: [
          Text("Cześć, miło Cię widzieć", style: AppStyles.mainBold),
          Text("Pulpit", style: TextStyle(fontSize: 24)),
          Text("W pobliżu", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
