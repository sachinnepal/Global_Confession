import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search confessions...",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}