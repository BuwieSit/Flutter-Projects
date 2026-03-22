import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/item_card.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_activity_1/widgets/custom_app_bar.dart';


class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
    
      
      bottomNavigationBar: BottomNavBar(indexCurrent: 0,),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/test_image.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),



          ],
        ),
      ),
    );
  }
}