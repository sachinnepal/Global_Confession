import 'package:flutter/material.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.add, "label": "Confess"},
      {"icon": Icons.favorite, "label": "Love"},
      {"icon": Icons.school, "label": "College"},
      {"icon": Icons.work, "label": "Work"},
      {"icon": Icons.sentiment_satisfied, "label": "Funny"},
    ];

    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF17171C),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  items[index]["icon"] as IconData,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                items[index]["label"] as String,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}