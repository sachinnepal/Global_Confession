import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget statCard(String title, String value) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFF17171C),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 18),

            const Center(
              child: Text(
                "Anonymous User",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                "Every confession tells a story.",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                statCard("Posted", "12"),
                const SizedBox(width: 14),
                statCard("Saved", "48"),
                const SizedBox(width: 14),
                statCard("Likes", "1.2K"),
              ],
            ),

            const SizedBox(height: 35),

            buildTile(Icons.settings, "Settings"),
            buildTile(Icons.lock_outline, "Privacy"),
            buildTile(Icons.dark_mode_outlined, "Dark Mode"),
            buildTile(Icons.info_outline, "About"),
            buildTile(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }
}