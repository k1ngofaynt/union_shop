class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String image;
  final String collection;
  final List<String> sizes;
  bool isSale;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.collection,
    this.sizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    this.isSale = false,
  });
}
  