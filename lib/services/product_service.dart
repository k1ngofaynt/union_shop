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
     Product(
      id: '2',
      name: 'Signature Hoodie',
      description: 'Essential signature hoodie in classic colors',
      price: 32.99,
      image: ImageAssets.productSignatureHoodie,  // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
    Product(
      id: '3',
      name: 'Essential T-Shirt',
      description: 'Comfortable essential t-shirt for everyday wear',
      price: 10.00,
      image: ImageAssets.productEssentialTshirt,  // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
    Product(
      id: '4',
      name: 'Limited Edition Zip Hoodies',
      description: 'Exclusive limited edition zip-up hoodies',
      price: 20.00,
      image: ImageAssets.productZipHoodies,  // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
  ];
  static List<Product> get products => _products;
}