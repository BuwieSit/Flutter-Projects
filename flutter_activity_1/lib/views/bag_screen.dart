import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_activity_1/widgets/custom_app_bar.dart';

class BagScreen extends StatelessWidget {
  const BagScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(appBar: const CustomAppBar(),
      
        bottomNavigationBar: BottomNavBar(indexCurrent: 1,),

        body: Column(
          children: [

          ],
        ),
      
      );
  }
}