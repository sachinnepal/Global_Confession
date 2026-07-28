import 'package:flutter/material.dart';
import 'package:global_confession/core/widgets/category_selector.dart';
import 'package:global_confession/services/firestore_service.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final TextEditingController _confessionController =
  TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  String _selectedCategory = "General";
  bool _isPosting = false;

  @override
  void dispose() {
    _confessionController.dispose();
    super.dispose();
  }

  Future<void> _postConfession() async {
    final confession = _confessionController.text.trim();

    if (confession.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please write a confession."),
        ),
      );
      return;
    }

    setState(() {
      _isPosting = true;
    });

    try {
      await _firestoreService.addConfession(
        content: confession,
        category: _selectedCategory,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Confession posted successfully!"),
        ),
      );

      _confessionController.clear();

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to post confession: $e"),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPosting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Confession"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How are you feeling today?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Share your thoughts anonymously.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            Container(
              height: 220,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF17171C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _confessionController,
                maxLines: null,
                expands: true,
                maxLength: 500,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: "Write your confession...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Mood",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("😊", style: TextStyle(fontSize: 30)),
                Text("😍", style: TextStyle(fontSize: 30)),
                Text("😢", style: TextStyle(fontSize: 30)),
                Text("😡", style: TextStyle(fontSize: 30)),
                Text("😂", style: TextStyle(fontSize: 30)),
                Text("😰", style: TextStyle(fontSize: 30)),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Replace this later with a callback from CategorySelector
            const CategorySelector(),

            const SizedBox(height: 30),

            SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text("Post Anonymously"),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${_confessionController.text.length} / 500",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isPosting ? null : _postConfession,
                child: _isPosting
                    ? const CircularProgressIndicator()
                    : const Text(
                  "Post Confession",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}