import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_activity_1/widgets/custom_app_bar.dart';
import '../widgets/my_bag_row.dart';
import '../models/item_model.dart';
import '../services/item_service.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
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
      bottomNavigationBar: BottomNavBar(indexCurrent: 1),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : 
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                // Header container
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            children: [
                              Text("Bringing Authentic Coffee to your Doorstep.",
                                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset('assets/images/coffee_beans.png', fit: BoxFit.contain, width: 100,),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    
                    itemCount: items.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                        child: MyBagRow(item: items[index]),
                      );
                      
                    },
                  ),
                ),
              ],
            )
          )
          
    );
  }
}