import 'package:clicker/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';

class ClickerApp extends StatelessWidget {
  const ClickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppNavigator.router,
      debugShowCheckedModeBanner: false,
    );
  }
}