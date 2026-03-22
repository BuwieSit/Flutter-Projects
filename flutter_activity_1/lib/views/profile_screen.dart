import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),

      bottomNavigationBar: BottomNavBar(indexCurrent: 2,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // full width content
          ],
        ),
      ),
    );
    
  }
}