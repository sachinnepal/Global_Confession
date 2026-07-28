import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/comment.dart';
import '../models/confession.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new confession
  Future<void> addConfession({
    required String content,
    required String category,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    await _firestore.collection('confessions').add({
      'content': content,
      'category': category,
      'userId': user.uid,
      'createdAt': Timestamp.now(),
      'likes': 0,
      'comments': 0,
      'likedBy': [],
    });
  }

  /// Get all confessions
  Stream<List<Confession>> getConfessions() {
    return _firestore
        .collection('confessions')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Confession.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  /// Like / Unlike
  Future<void> toggleLike(Confession confession) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final docRef =
    _firestore.collection('confessions').doc(confession.id);

    if (confession.likedBy.contains(user.uid)) {
      await docRef.update({
        'likes': FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([user.uid]),
      });
    } else {
      await docRef.update({
        'likes': FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([user.uid]),
      });
    }
  }

  /// Add Comment
  Future<void> addComment({
    required String confessionId,
    required String text,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final confessionRef =
    _firestore.collection('confessions').doc(confessionId);

    await confessionRef.collection('comments').add({
      'text': text,
      'userId': user.uid,
      'createdAt': Timestamp.now(),
    });

    await confessionRef.update({
      'comments': FieldValue.increment(1),
    });
  }

  /// Get Comments
  Stream<List<CommentModel>> getComments(String confessionId) {
    return _firestore
        .collection('confessions')
        .doc(confessionId)
        .collection('comments')
        .orderBy('createdAt')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => CommentModel.fromMap(doc.data(), doc.id))
          .toList();
    });
  }
}