import 'package:union_shop/models/product.dart';
import 'package:union_shop/utils/image_constants.dart';
class ProductService {
  static final List<Product> _products = [
    Product(
      id: '1',
      name: 'Graduation Hoodies',
      description: 'Premium graduation hoodie with embroidered logo',
      price: 35.00,
      image: ImageAssets.productGraduationHoodies,  // ← CHANGED FROM URL
      collection: 'graduation',
      isSale: false,
    ),
  ];
  static List<Product> get products => _products;
}