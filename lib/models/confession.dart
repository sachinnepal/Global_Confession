import 'package:cloud_firestore/cloud_firestore.dart';

class Confession {
  final String id;
  final String content;
  final String category;
  final String userId;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final List<String> likedBy;

  Confession({
    required this.id,
    required this.content,
    required this.category,
    required this.userId,
    required this.createdAt,
    required this.likes,
    required this.comments,
    required this.likedBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'category': category,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
      'likes': likes,
      'comments': comments,
      'likedBy': likedBy,
    };
  }

  factory Confession.fromMap(
      String id,
      Map<String, dynamic> map,
      ) {
    return Confession(
      id: id,
      content: map['content'] ?? '',
      category: map['category'] ?? 'General',
      userId: map['userId'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      likedBy: List<String>.from(map['likedBy'] ?? []),
    );
  }

  Confession copyWith({
    String? id,
    String? content,
    String? category,
    String? userId,
    DateTime? createdAt,
    int? likes,
    int? comments,
    List<String>? likedBy,
  }) {
    return Confession(
      id: id ?? this.id,
      content: content ?? this.content,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      likedBy: likedBy ?? this.likedBy,
    );
  }

  @override
  String toString() {
    return 'Confession(id: $id, content: $content, category: $category, userId: $userId, createdAt: $createdAt, likes: $likes, comments: $comments, likedBy: $likedBy)';
  }
}