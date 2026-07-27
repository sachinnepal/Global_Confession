import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          color: const Color(0xFF17171C),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navItem(
              icon: Icons.home,
              label: "Home",
              index: 0,
            ),

            navItem(
              icon: Icons.location_on,
              label: "Nearby",
              index: 1,
            ),

            // Space for Floating Action Button
            const SizedBox(width: 60),

            navItem(
              icon: Icons.bookmark,
              label: "Saved",
              index: 2,
            ),

            navItem(
              icon: Icons.person,
              label: "Profile",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => onTap(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.deepPurple : Colors.grey,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.deepPurple
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}