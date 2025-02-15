import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobaiflutter/ui/screens/book_details_screen.dart';
import 'package:mobaiflutter/ui/screens/moodScreen.dart';
import 'search_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Set<String> favoriteBooks = {};
  final List<String> categories = ['For you', 'Top sales', 'Top free', 'Mood'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    // Ajoutez cet écouteur pour forcer la mise à jour de l'interface lors du changement d'onglet
  _tabController.addListener(() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleFavorite(String bookId) {
    setState(() {
      if (favoriteBooks.contains(bookId)) {
        favoriteBooks.remove(bookId);
      } else {
        favoriteBooks.add(bookId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar with curved bottom
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF00A392),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Logo and notifications
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/logobar.png', height: 60),
                        const SizedBox(width: 1),
                        Text(
                          'Bookini',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined, color: Colors.white,size: 31,),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Enhanced Search Bar with increased height
               GestureDetector(
  onTap: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SearchScreen()),
  ),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(
              Icons.auto_awesome, 
              color: Color(0xFF00A392),
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Search a book with AI...',
                style: GoogleFonts.poppins(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.keyboard_arrow_up, 
                  color: Colors.grey,
                  size: 22,
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.mic, 
                  color: Colors.grey,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),
              ],
            ),
          ),
          // Custom Tab Bar without underline
  Container(
  margin: const EdgeInsets.only(top: 16, bottom: 16), // Garde l'espace vertical
  height: 40,
  child: TabBar(
    controller: _tabController,
    isScrollable: true,
    labelColor: Colors.white,
    unselectedLabelColor: const Color(0xFF00A392),
    labelStyle: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    indicator: const BoxDecoration(),
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.zero,
    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.only(right: 16, left: 8), // Réduit uniquement le padding gauche
    dividerColor: Colors.transparent,
    tabs: List.generate(
      categories.length,
      (index) => Tab(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: _tabController.index == index 
                ? const Color(0xFF00A392) 
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF00A392),
              width: 1.5,
            ),
          ),
          child: Text(
            categories[index],
            style: GoogleFonts.poppins(
              color: _tabController.index == index 
                  ? Colors.white 
                  : const Color(0xFF00A392),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  ),
),
          // Tab Bar View with Book Grid
        Expanded(
  child: TabBarView(
    controller: _tabController,
    children: [
      _buildBookGrid('For you'),
      _buildBookGrid('Top sales'),
      _buildBookGrid('Top free'),
      const MoodScreen(),
    ],
  ),
),
        ],
      ),
    );
  }

  // The _buildBookGrid and _buildBookCard methods remain unchanged
 
Widget _buildBookGrid(String category) {
  return GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.53, // Ratio réduit pour donner plus de hauteur
      crossAxisSpacing: 16,
      mainAxisSpacing: 20, // Augmenté l'espace vertical entre les cartes
    ),
    itemCount: 6,
    itemBuilder: (context, index) {
      final bookId = '${category}_$index';
      return _buildBookCard(bookId);
    },
  );
}
Widget _buildBookCard(String bookId) {
  return GestureDetector(
    onTap: () {
      // Navigate to book details
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookDetailsScreen(bookId: '1')),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book cover with favorite icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  'assets/book.png',
                  height: 220, // Increased height for better cover display
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Favorite icon
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => toggleFavorite(bookId),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      favoriteBooks.contains(bookId) 
                          ? Icons.favorite 
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Book details
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Book Title',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // Tags row
                Row(
                  children: [
                    _buildTag('Fantasy'),
                    const SizedBox(width: 4),
                    _buildTag('Horror'),
                  ],
                ),
                const SizedBox(height: 6),
                // Price and rating row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '600DA',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '590DA',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: const Color(0xFF00A392),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '4.9',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

 Widget _buildTag(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFF00A392).withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: const Color(0xFF00A392),
        fontSize: 10,
      ),
    ),
  );
}
}