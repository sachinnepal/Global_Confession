import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_confession/app/naviagtion/main_navigation.dart';

import 'firebase_options.dart';
import 'package:global_confession/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AuthService().signInAnonymously();

  runApp(const GlobalConfessionApp());
}

class GlobalConfessionApp extends StatelessWidget {
  const GlobalConfessionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Confession',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainNavigation(),
    );
  }
}