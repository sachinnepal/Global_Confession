import 'package:flutter/material.dart';
import 'package:global_confession/core/widgets/confession_card.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Confessions"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            "Your Favorites ❤️",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "Confessions you've saved will appear here.",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 25),

          ConfessionCard(
            confession:
            "I still think about someone from years ago, even though we've both moved on.",
            time: "1 day ago",
            likes: 932,
            comments: 84,
          ),

          ConfessionCard(
            confession:
            "Today I resigned from my job to finally chase the career I truly wanted.",
            time: "3 days ago",
            likes: 1542,
            comments: 201,
          ),
        ],
      ),
    );
  }
}