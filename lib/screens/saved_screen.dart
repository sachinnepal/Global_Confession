import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/widgets/confession_card.dart';
import '../models/confession.dart';
import '../screens/comments_screen.dart';
import '../services/firestore_service.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Confessions"),
      ),
      body: StreamBuilder<List<Confession>>(
        stream: _firestoreService.getSavedConfessions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final confessions = snapshot.data ?? [];

          if (confessions.isEmpty) {
            return const Center(
              child: Text(
                "No saved confessions yet.",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: confessions.length,
            itemBuilder: (context, index) {
              final confession = confessions[index];

              final isLiked = currentUser != null &&
                  confession.likedBy.contains(currentUser.uid);

              final isSaved = currentUser != null &&
                  confession.savedBy.contains(currentUser.uid);

              return ConfessionCard(
                confession: confession.content,
                time: confession.createdAt,
                likes: confession.likes,
                comments: confession.comments,

                isLiked: isLiked,
                isSaved: isSaved,

                onLike: () async {
                  await _firestoreService.toggleLike(confession);
                },

                onBookmark: () async {
                  await _firestoreService.toggleBookmark(confession);
                },

                onComment: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommentsScreen(
                        confession: confession,
                      ),
                    ),
                  );
                },

                onShare: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Share feature coming soon!"),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}