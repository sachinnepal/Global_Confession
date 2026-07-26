import 'package:flutter/material.dart';

import 'app/naviagtion/main_navigation.dart';
import 'core/theme/app_theme.dart';
import 'package:global_confession/screens//home_screen.dart';

void main() {
  runApp(const GlobalConfessionApp());
}

class GlobalConfessionApp extends StatelessWidget {
  const GlobalConfessionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Confession',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const  MainNavigation(),
    );
  }
}