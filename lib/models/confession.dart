import 'package:cloud_firestore/cloud_firestore.dart';

class Confession {
  final String id;
  final String content;
  final String category;
  final String userId;
  final DateTime createdAt;
  final int likes;
  final int comments;

  /// Users who liked this confession
  final List<String> likedBy;

  /// Users who bookmarked this confession
  final List<String> savedBy;

  const Confession({
    required this.id,
    required this.content,
    required this.category,
    required this.userId,
    required this.createdAt,
    required this.likes,
    required this.comments,
    required this.likedBy,
    required this.savedBy,
  });

  /// Convert object to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'category': category,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
      'likes': likes,
      'comments': comments,
      'likedBy': likedBy,
      'savedBy': savedBy,
    };
  }

  /// Create object from Firestore document
  factory Confession.fromMap(
      Map<String, dynamic> map,
      String id,
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
      savedBy: List<String>.from(map['savedBy'] ?? []),
    );
  }

  /// Copy with new values
  Confession copyWith({
    String? id,
    String? content,
    String? category,
    String? userId,
    DateTime? createdAt,
    int? likes,
    int? comments,
    List<String>? likedBy,
    List<String>? savedBy,
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
      savedBy: savedBy ?? this.savedBy,
    );
  }

  @override
  String toString() {
    return '''
Confession(
  id: $id,
  content: $content,
  category: $category,
  userId: $userId,
  createdAt: $createdAt,
  likes: $likes,
  comments: $comments,
  likedBy: $likedBy,
  savedBy: $savedBy,
)
''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Confession &&
        other.id == id &&
        other.content == content &&
        other.category == category &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.likes == likes &&
        other.comments == comments &&
        other.likedBy.toString() == likedBy.toString() &&
        other.savedBy.toString() == savedBy.toString();
  }

  @override
  int get hashCode {
    return id.hashCode ^
    content.hashCode ^
    category.hashCode ^
    userId.hashCode ^
    createdAt.hashCode ^
    likes.hashCode ^
    comments.hashCode ^
    likedBy.hashCode ^
    savedBy.hashCode;
  }
}