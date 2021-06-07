class Product {
  final int id;
  final String title;
  final String seller;
  final String image;
  final String lessDescription;
  final String description;
  final int price;
  final double rating;
  final List<String> otherProductImages;

  Product({
    required this.id,
    required this.title,
    required this.seller,
    required this.image,
    required this.lessDescription,
    required this.description,
    required this.price,
    required this.rating,
    required this.otherProductImages,
  });
}
