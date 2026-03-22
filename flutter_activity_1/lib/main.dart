import 'package:flutter/material.dart';
import 'package:flutter_activity_1/views/for_you_screen.dart';
import 'package:flutter_activity_1/views/item_screen.dart';
import 'package:flutter_activity_1/views/landing_screen.dart';
import 'package:flutter_activity_1/views/profile_screen.dart';
import 'package:flutter_activity_1/views/access_screen.dart';
import 'package:flutter_activity_1/views/bag_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
    GoRoute(path: '/for-you', builder: (context, state) => const ForYouScreen()),
    GoRoute(path: '/access', builder: (context, state) => const AccessScreen()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
    GoRoute(path: '/my-bag', builder: (context, state) => const BagScreen()),
    GoRoute(path: '/item/:itemId', builder: (context, state) {
      final itemIdStr = state.pathParameters['itemId']; 
      final itemId = itemIdStr != null ? int.tryParse(itemIdStr): null;
      return ItemScreen(itemId: itemId);
    }),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(
          primaryColor: const Color(0xFF210F04),
          primaryColorLight: Color(0xFF690500),
          primaryColorDark: Color(0xFF934B00),
          scaffoldBackgroundColor: const Color(0xFF210F04),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFBB6B00),
          ),

        ),
    );
  }
}

// Color(0xFF210F04) - coffee bean
// Color(0xFF452103) - Dark walnut
// Color(0xFF690500) - dark garnet (red)
// Color(0xFF934B00) - Chocolate brown
// Color(0xFFBB6B00) - Copperwood