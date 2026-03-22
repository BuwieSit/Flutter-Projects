
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Landing Page", style: TextStyle(color: Colors.white),)
            ]
            
          ),
        ),
      ),

    );
  }
}