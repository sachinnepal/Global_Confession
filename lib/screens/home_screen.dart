import 'package:flutter/material.dart';

import 'package:global_confession/core/widgets/category_chips.dart';
import 'package:global_confession/core/widgets/confession_card.dart';
import 'package:global_confession/core/widgets/featured_confession.dart';
import 'package:global_confession/core/widgets/greeting_header.dart';
import 'package:global_confession/core/widgets/search_bar_widget.dart';
import 'package:global_confession/core/widgets/quick_access.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: const [
              GreetingHeader(),

              SizedBox(height: 24),
              QuickAccess(),
              FeaturedConfession(),

              SearchBarWidget(),

              SizedBox(height: 20),

              CategoryChips(),

              SizedBox(height: 24),

              ConfessionCard(
                confession:
                "i just love my lil girl name laxu .she is soso sweet.",
                time: "2h ago",
                likes: 100000,
                comments: 32000,
              ),

              ConfessionCard(
                confession:
                "Sometimes I pretend I'm okay even when I'm struggling inside.",
                time: "5h ago",
                likes: 781,
                comments: 143,
              ),

              ConfessionCard(
                confession:
                "I want to quit my job and travel the world before it's too late.",
                time: "1 day ago",
                likes: 1204,
                comments: 217,
              ),
            ],
          ),
        ),
      ),
    );
  }
}