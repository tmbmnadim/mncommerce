import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Search",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 100,
        ),
      ),
    );
  }
}
