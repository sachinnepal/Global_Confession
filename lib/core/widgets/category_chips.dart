import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryChip(
            label: "🔥 Trending",
            isSelected: true,
          ),

          SizedBox(width: 12),

          CategoryChip(
            label: "🌍 Global",
            isSelected: false,
          ),

          SizedBox(width: 12),

          CategoryChip(
            label: "📍 Nearby",
            isSelected: false,
          ),

          SizedBox(width: 12),

          CategoryChip(
            label: "⭐ Latest",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.deepPurple
            : const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}