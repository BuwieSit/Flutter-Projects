import 'package:flutter/material.dart';
import 'package:flutter_activity_1/models/item_model.dart';

class MyBagRow extends StatelessWidget {
  final Item item;
  const MyBagRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.image ?? 'assets/images/coffee_beans.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 200,
                child: Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),

                ),
              ),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 100,
                child: Text(
                  item.shopName,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}