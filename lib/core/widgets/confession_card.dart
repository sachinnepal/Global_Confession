import 'package:flutter/material.dart';

class ConfessionCard extends StatelessWidget {
  const ConfessionCard({super.key});

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

          /// HEADER
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
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
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      "2 hours ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// CONFESSION
          const Text(
            "Today I finally confessed my feelings to my best friend. I was nervous all day, but I'm glad I finally had the courage to say it.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 20),

          /// ACTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              actionButton(
                Icons.favorite_border,
                "245",
              ),

              actionButton(
                Icons.chat_bubble_outline,
                "32",
              ),

              actionButton(
                Icons.share_outlined,
                "Share",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget actionButton(
      IconData icon,
      String text,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),

        const SizedBox(width: 6),

        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}