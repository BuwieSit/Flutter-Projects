import 'package:flutter/material.dart';

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
                Image.asset(
                  'assets/images/logo_no_bg.png',
                  width: 50,
                  fit: BoxFit.contain,
                ),
                Text(
                  "App name",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
                Icon(Icons.search, color: Colors.white,)

            ],
          )
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}