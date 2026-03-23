import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/item_card.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_activity_1/widgets/custom_app_bar.dart';
import '../services/item_service.dart';
import '../models/item_model.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();

}

class _ForYouScreenState extends State<ForYouScreen> {
  List<Item> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    final loadedItems = await ItemService.loadItems();
    setState(() {
      items = loadedItems;
      isLoading = false;
    });
  }

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
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor]),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            "Coffeelivery",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Bringing Authentic Coffee to your Doorstep.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/coffee_beans.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(height: 20,),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                
              ),
              child: Text(
                "For You",
                textAlign: .center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),

            ),

            const SizedBox(height: 16),

            if(isLoading) const Center(child: CircularProgressIndicator())
            else 
              GridView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                (
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  
                  return ItemCard(
                    item: item,
                  );
                },
              )
            
            
          ],
        ),
      ),
    );
  }
}

