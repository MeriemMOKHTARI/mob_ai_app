import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: moodCategories.length,
      itemBuilder: (context, index) {
        final category = moodCategories[index];
        return _buildMoodCard(category);
      },
    );
  }

  Widget _buildMoodCard(MoodCategory category) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(category.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          category.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MoodCategory {
  final String name;
  final String imageUrl;

  const MoodCategory({
    required this.name,
    required this.imageUrl,
  });
}

final List<MoodCategory> moodCategories = [
  MoodCategory(name: 'Romance', imageUrl: 'assets/romance.jpg'),
  MoodCategory(name: 'Fantasy', imageUrl: 'assets/Fantasy.jpg'),
  MoodCategory(name: 'Horror', imageUrl: 'assets/Horror.jpg'),
    MoodCategory(name: 'Adventure', imageUrl: 'assets/Adventure.jpg'),
  MoodCategory(name: 'Mystery', imageUrl: 'assets/mystery.jpg'),
  MoodCategory(name: 'Psychology', imageUrl: 'assets/Psychologue.jpg'),
  MoodCategory(name: 'Comedy', imageUrl: 'assets/Comedy.jpg'),
  MoodCategory(name: 'Action', imageUrl: 'assets/Action.jpg'),
  MoodCategory(name: 'Adventure', imageUrl: 'assets/Adventure.jpg'),
  MoodCategory(name: "Children's", imageUrl: 'assets/Children.jpg'),
  MoodCategory(name: 'Comics', imageUrl: 'assets/Comics.jpg'),
  MoodCategory(name: 'Art', imageUrl: 'assets/Art.jpg'),
];