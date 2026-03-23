
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileInfoRow extends StatelessWidget {
  final Widget rowIcon;
  final String rowText;
  final VoidCallback? rowOnTap;

  const ProfileInfoRow ({super.key, required this.rowIcon, required this.rowText, this.rowOnTap});
  
  @override
  Widget build(BuildContext context) {
    return 
     MouseRegion(
      cursor: SystemMouseCursors.click,
      
        child: 
        GestureDetector(
          onTap: rowOnTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                rowIcon,
                Text(
                  rowText,
                  style: TextStyle(color: Colors.white),
                ),
                HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Colors.white),
              ],
            ),
        )
          
     );
  }
}