import 'package:flutter/material.dart';

class ConfessionCard extends StatelessWidget {
  final String confession;
  final String time;
  final int likes;
  final int comments;

  const ConfessionCard({
    super.key,
    required this.confession,
    required this.time,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anonymous",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            confession,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_border,
                      color: Colors.grey, size: 20),
                  const SizedBox(width: 5),
                  Text("$likes",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.chat_bubble_outline,
                      color: Colors.grey, size: 20),
                  const SizedBox(width: 5),
                  Text("$comments",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.share_outlined,
                      color: Colors.grey, size: 20),
                  SizedBox(width: 5),
                  Text(
                    "Share",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}