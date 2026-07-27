import 'package:flutter/material.dart';
import 'package:global_confession/core/widgets/confession_card.dart';

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            "📍 Nearby Confessions",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "Discover anonymous confessions from people around you.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25),

          LocationCard(
            city: "Barrie",
            posts: "24",
          ),

          SizedBox(height: 15),

          LocationCard(
            city: "Toronto",
            posts: "102",
          ),

          SizedBox(height: 15),

          LocationCard(
            city: "Mississauga",
            posts: "56",
          ),

          SizedBox(height: 35),

          Text(
            "Trending Nearby",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          ConfessionCard(
            confession:
            "I accidentally confessed to my crush today... and they smiled.",
            time: "45 min ago",
            likes: 234,
            comments: 28,
          ),

          ConfessionCard(
            confession:
            "Sometimes I drive around the city just to clear my mind.",
            time: "2 hours ago",
            likes: 512,
            comments: 61,
          ),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String city;
  final String posts;

  const LocationCard({
    super.key,
    required this.city,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "$posts Confessions",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}