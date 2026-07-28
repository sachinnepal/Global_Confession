import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:global_confession/models/confession.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create a new confession
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
      'createdAt': FieldValue.serverTimestamp(),
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
        .map((snapshot) => snapshot.docs
        .map((doc) => Confession.fromMap(doc.id, doc.data()))
        .toList());
  }

  /// Like / Unlike confession
  Future<void> toggleLike(Confession confession) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final docRef =
    _firestore.collection('confessions').doc(confession.id);

    if (confession.likedBy.contains(user.uid)) {
      // Unlike
      await docRef.update({
        'likes': FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([user.uid]),
      });
    } else {
      // Like
      await docRef.update({
        'likes': FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([user.uid]),
      });
    }
  }
}