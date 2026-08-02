import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConfessionCard extends StatelessWidget {
  final String confession;
  final DateTime time;
  final int likes;
  final int comments;

  /// Like
  final bool isLiked;
  final VoidCallback? onLike;

  /// Bookmark
  final bool isSaved;
  final VoidCallback? onBookmark;

  /// Comment
  final VoidCallback? onComment;

  /// Share
  final VoidCallback? onShare;

  const ConfessionCard({
    super.key,
    required this.confession,
    required this.time,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.isSaved = false,
    this.onLike,
    this.onBookmark,
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
                timeago.format(time),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),

          const SizedBox(height: 18),

          /// Confession Text
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
              /// Like
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
                        color:
                        isLiked ? Colors.red : Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "$likes",
                        style: TextStyle(
                          color:
                          isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Comment
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

              /// Bookmark
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onBookmark,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    isSaved
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: isSaved
                        ? Colors.amber
                        : Colors.grey,
                  ),
                ),
              ),

              /// Share
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onShare,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.share_outlined,
                    color: Colors.grey,
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