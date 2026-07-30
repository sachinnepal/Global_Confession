import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/widgets/category_chips.dart';
import '../core/widgets/confession_card.dart';
import '../core/widgets/featured_confession.dart';
import '../core/widgets/greeting_header.dart';
import '../core/widgets/quick_access.dart';
import '../core/widgets/search_bar_widget.dart';

import '../models/confession.dart';
import '../screens/comments_screen.dart';
import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<List<Confession>>(
            stream: _firestoreService.getConfessions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
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

              return ListView(
                children: [
                  const GreetingHeader(),

                  const SizedBox(height: 24),

                  const QuickAccess(),

                  const SizedBox(height: 20),

                  const FeaturedConfession(),

                  const SizedBox(height: 20),

                  const SearchBarWidget(),

                  const SizedBox(height: 20),

                  const CategoryChips(),

                  const SizedBox(height: 24),

                  if (confessions.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          "No confessions yet.\nBe the first one!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                  ...confessions.map(
                        (confession) {
                      final isLiked = currentUser != null &&
                          confession.likedBy.contains(
                            currentUser.uid,
                          );

                      final isSaved = currentUser != null &&
                          confession.savedBy.contains(
                            currentUser.uid,
                          );

                      return ConfessionCard(
                        confession: confession.content,
                        time: confession.createdAt.toString(),
                        likes: confession.likes,
                        comments: confession.comments,

                        isLiked: isLiked,
                        isSaved: isSaved,

                        onLike: () async {
                          await _firestoreService
                              .toggleLike(confession);
                        },

                        onBookmark: () async {
                          await _firestoreService
                              .toggleBookmark(confession);
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
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Share feature coming soon!",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}