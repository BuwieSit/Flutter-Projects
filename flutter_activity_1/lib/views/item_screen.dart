import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/custom_app_bar.dart';

class ItemScreen extends StatelessWidget {
  final int? itemId;

  const ItemScreen({super.key, this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );

  }
}