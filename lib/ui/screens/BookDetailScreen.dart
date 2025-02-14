import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final String sectionTitle;

  const BookDetailScreen({
    super.key,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitle),
        backgroundColor: const Color(0xFF00A392),
      ),
      body: const Center(
        child: Text('Book Detail Screen - Coming Soon'),
      ),
    );
  }
}

