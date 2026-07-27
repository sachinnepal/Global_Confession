import 'package:flutter/material.dart';
import 'package:global_confession/core/widgets/featured_confession.dart';

class FeaturedConfession extends StatelessWidget {
  const FeaturedConfession({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6D5DF6),
            Color(0xFF8B7CF8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "🔥 Confession of the Day",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "I finally had the courage to tell my parents that I want to become a software developer instead of following the career they chose for me.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 22),

          const Row(
            children: [
              Icon(Icons.favorite, color: Colors.white),
              SizedBox(width: 6),
              Text(
                "1.2k",
                style: TextStyle(color: Colors.white),
              ),

              SizedBox(width: 20),

              Icon(Icons.chat_bubble_outline, color: Colors.white),
              SizedBox(width: 6),
              Text(
                "314",
                style: TextStyle(color: Colors.white),
              ),

              Spacer(),

              Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}