
import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/button.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Image.asset('assets/images/logo_no_bg.png', width: 200, fit: BoxFit.contain,),
              Text("Coffeelivery", 
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
              ),
              CustomButton(text: "Shop Now!", onPressed: () => {context.go('/access')},)
            ]
            
          ),
        ),
      );
  }
}