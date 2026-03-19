import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Image.asset(
                  '../assets/images/test_image.png'
                )
              ],
            ),
            
            Row(
              children: [
                SingleChildScrollView(

                ),
                SingleChildScrollView(

                ),
                SingleChildScrollView(

                ),
              ]
            ),

          ],
        ),
      ),
    );
  }
}