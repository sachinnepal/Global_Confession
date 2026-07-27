import 'package:flutter/material.dart';

import '../../screens/compose_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/nearby_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/saved_screen.dart';
import '../../core/widgets/custom_bottom_nav.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    NearbyScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ComposeScreen(),
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        elevation: 6,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
    );
  }
}