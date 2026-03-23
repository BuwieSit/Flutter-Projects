
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_activity_1/models/item_model.dart';

class ItemCard extends StatelessWidget {
  // final int? itemId;
  // final String? itemName;
  // final String? shopName;
  // final double? itemPrice;
  // final String? itemImage;
  final Item item;

  const ItemCard({
    super.key,
    required this.item,
    // this.itemId,
    // this.itemName,
    // this.shopName,
    // this.itemPrice,
    // this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return 
    MouseRegion(
      cursor: SystemMouseCursors.click,
  
      child: SizedBox(
        height: 100,
        child: Card(
          color: const Color.fromARGB(0, 255, 255, 255),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                item.image != null
                    ? Image.asset(
                        item.image!,
                        width: 120,
                        fit: BoxFit.contain,
                      )
                    : const Icon(Icons.image, size: 120, color: Colors.white),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        item.name,
                        textAlign: .center,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            HugeIcon(icon: HugeIcons.strokeRoundedCash01, color: Colors.white, size: 16,),
                            Text(
                              '\$${item.price}',
                              style: const TextStyle(color: Colors.white70, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HugeIcon(icon: HugeIcons.strokeRoundedStore04, color: Colors.white, size: 16,),
                            const SizedBox(width: 2),
                            Flexible(
                              child: Text(
                                item.shopName,
                                style: TextStyle(color: Colors.white54, fontSize: 10),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}