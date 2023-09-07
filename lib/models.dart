
class Product {
  final String imageUrl;
  final String title;
  final int rating;
  final String location;
  final String addedSince;

  Product({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.location,
    required this.addedSince,
  });
}

class AppData {
  static final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Sports',
    'Toys',
    'Automotive',
    'Grocery',

  ];
}


class Review {
  final String imageUrl;
  final String title;
  final int rating;  // I added this field based on your usage. Remove if not required.

  Review({
    required this.imageUrl,
    required this.title,
    required this.rating,
  });
}
