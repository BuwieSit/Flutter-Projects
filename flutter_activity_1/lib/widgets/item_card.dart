
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int? itemId;
  final String? itemName;
  final double? itemPrice;
  final String? itemImage;

  const ItemCard({
    super.key,
    this.itemId,
    this.itemName,
    this.itemPrice,
    this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.blue,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              itemImage != null
                  ? Image.asset(
                      itemImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 50, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName ?? '-',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${itemPrice?.toString() ?? '-'}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}