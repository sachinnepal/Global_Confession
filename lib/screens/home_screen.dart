import 'package:flutter/material.dart';

import 'package:global_confession/core/widgets/category_chips.dart';
import 'package:global_confession/core/widgets/confession_card.dart';
import 'package:global_confession/core/widgets/greeting_header.dart';
import 'package:global_confession/core/widgets/search_bar_widget.dart';

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

              SearchBarWidget(),

              SizedBox(height: 20),

              CategoryChips(),

              SizedBox(height: 24),

              ConfessionCard(),

              ConfessionCard(),

              ConfessionCard(),
            ],
          ),
        ),
      ),
    );
  }
}