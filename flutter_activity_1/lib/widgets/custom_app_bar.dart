import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
                Text(
                  "Coffeelivery",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01, 
                  color: Theme.of(context).primaryColor,
                )

            ],
          )
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}