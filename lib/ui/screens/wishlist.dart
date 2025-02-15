import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
  });
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Book> wishlist = [
    Book(
      id: '1',
      title: 'Harry Potter and the Deathly Hallows',
      author: 'J.K. Rowling',
      imageUrl: 'https://picsum.photos/160/200',
      rating: 4.9,
      price: '\$9.99',
    ),
    Book(
      id: '2',
      title: 'The Lost Metal: A Mistborn Novel',
      author: 'Brandon Sanderson',
      imageUrl: 'https://picsum.photos/160/200',
      rating: 4.8,
      price: '\$4.99',
    ),
    // Add more books as needed
  ];

  void removeFromWishlist(String bookId) {
    setState(() {
      wishlist.removeWhere((book) => book.id == bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                 
                  const Text(
                    'Wishlist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Wishlist Content
            Expanded(
              child: wishlist.isEmpty
                  ? const Center(
                      child: Text(
                        'Your wishlist is empty',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: wishlist.length,
                      itemBuilder: (context, index) {
                        final book = wishlist[index];
                        return Dismissible(
                          key: Key(book.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: const Text('Remove from Favorites?'),
                                  content: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        book.imageUrl,
                                        width: 50,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      book.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF00A392),
                                      ),
                                      child: const Text('Yes, Remove'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onDismissed: (direction) {
                            removeFromWishlist(book.id);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  // Book Cover
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      book.imageUrl,
                                      width: 80,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Book Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.amber[600],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              book.rating.toString(),
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          book.price,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF00A392),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Delete Icon
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () async {
                                      if (await showDialog<bool>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                title: const Text(
                                                    'Remove from Favorites?'),
                                                content: ListTile(
                                                  contentPadding: EdgeInsets.zero,
                                                  leading: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    child: Image.network(
                                                      book.imageUrl,
                                                      width: 50,
                                                      height: 70,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    book.title,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                  ),
                                                  ElevatedButton(
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color(0xFF00A392),
                                                    ),
                                                    child:
                                                        const Text('Yes, Remove'),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false) {
                                        removeFromWishlist(book.id);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

