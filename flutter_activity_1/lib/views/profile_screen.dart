import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft02,
                  color: Colors.white,
                  size: 40,
                ),
                Text("User Name", style: TextStyle(color: Colors.white),),
                SizedBox(width: 30),
              ],
            ),
          ),
      ),

      bottomNavigationBar: BottomNavBar(indexCurrent: 2),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150, height: 150,  
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100))
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
    
  }
}