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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-width row
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.orangeAccent,
              child: const Text(
                "Recommended for You",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

            ),

            const SizedBox(height: 16),

            // 2-column grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ItemCard(itemId: 1, itemName: "Beans", itemPrice: 502),
                ItemCard(itemId: 2, itemName: "Rice", itemPrice: 300),
                ItemCard(itemId: 3, itemName: "Milk", itemPrice: 120),
                ItemCard(itemId: 4, itemName: "Eggs", itemPrice: 250),
              ],
            ),
          ],
        ),
      ),
    );
  }
}