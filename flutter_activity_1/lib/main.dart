import 'package:flutter/material.dart';
import 'package:flutter_activity_1/views/dashboard_screen.dart';
import 'package:flutter_activity_1/views/item_screen.dart';
import 'package:flutter_activity_1/views/profile_screen.dart';
import 'package:flutter_activity_1/views/access_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
    GoRoute(path: '/access', builder: (context, state) => const AccessScreen()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
    GoRoute(path: '/item/:itemId', builder: (context, state) {
      final itemId = state.pathParameters['itemId'];
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
    );
  }
}