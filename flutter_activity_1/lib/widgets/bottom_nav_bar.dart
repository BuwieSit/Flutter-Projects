import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNavBar extends StatelessWidget  {
  final int indexCurrent;
  
  const BottomNavBar({super.key, this.indexCurrent = 0});
  
  final double iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return 
      BottomNavigationBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          selectedItemColor: Theme.of(context).primaryColorLight,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          currentIndex: indexCurrent, 
          onTap: (index) {
            switch (index) {
              case 0:
                GoRouter.of(context).go('/');
                break;
              case 1:
                GoRouter.of(context).go('/my-bag');
                break;
              case 2:
                GoRouter.of(context).go('/profile');
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome07,
                color: Theme.of(context).primaryColorLight,
                size: iconSize,
              ),
              label: "For You",
              tooltip: "Browse products",
            ),
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedShoppingBag01,
                color: Theme.of(context).primaryColorLight,
                size: iconSize,
              ),
              label: "My Bag",
              tooltip: "Check added items",
            ),
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                color: Theme.of(context).primaryColorLight,
                size: iconSize,
              ),
              label: "Profile",
              tooltip: "Your Profile",
            ),
          ],
        );
    
  }

}