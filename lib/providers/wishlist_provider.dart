import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String price;
  final List<String> categories;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.categories,
  });
}

class WishlistProvider extends ChangeNotifier {
  final List<Book> _wishlist = [];

  List<Book> get wishlist => _wishlist;

  bool isInWishlist(String bookId) {
    return _wishlist.any((book) => book.id == bookId);
  }

  void addToWishlist(Book book) {
    if (!isInWishlist(book.id)) {
      _wishlist.add(book);
      notifyListeners();
    }
  }

  void removeFromWishlist(String bookId) {
    _wishlist.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }
}

