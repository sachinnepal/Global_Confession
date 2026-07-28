import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:global_confession/core/widgets/category_chips.dart';
import 'package:global_confession/core/widgets/confession_card.dart';
import 'package:global_confession/core/widgets/featured_confession.dart';
import 'package:global_confession/core/widgets/greeting_header.dart';
import 'package:global_confession/core/widgets/quick_access.dart';
import 'package:global_confession/core/widgets/search_bar_widget.dart';

import 'package:global_confession/models/confession.dart';
import 'package:global_confession/services/firestore_service.dart';

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

              return ListView(
                children: [
                  const GreetingHeader(),

                  const SizedBox(height: 24),

                  const QuickAccess(),

                  const FeaturedConfession(),

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
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                  ...confessions.map(
                        (confession) {
                      final isLiked = currentUser != null &&
                          confession.likedBy.contains(currentUser.uid);

                      return ConfessionCard(
                        confession: confession.content,
                        time: confession.createdAt.toString(),
                        likes: confession.likes,
                        comments: confession.comments,
                        isLiked: isLiked,

                        onLike: () async {
                          await _firestoreService.toggleLike(confession);
                        },

                        onComment: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Comments coming soon!"),
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