import 'package:flutter/material.dart';

class ConfessionCard extends StatelessWidget {
  final String confession;
  final String time;
  final int likes;
  final int comments;

  /// True if current user has liked this confession
  final bool isLiked;

  /// Button callbacks
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const ConfessionCard({
    super.key,
    required this.confession,
    required this.time,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.onLike,
    this.onComment,
    this.onShare,
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
          /// Header
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
                child: Text(
                  "Anonymous",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// Confession
          Text(
            confession,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          /// Bottom Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onLike,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isLiked
                            ? Colors.red
                            : Colors.grey,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "$likes",
                        style: TextStyle(
                          color: isLiked
                              ? Colors.red
                              : Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onComment,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "$comments",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onShare,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.share_outlined,
                        color: Colors.grey,
                        size: 22,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}