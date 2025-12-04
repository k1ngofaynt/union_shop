import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/utils/image_constants.dart';

class ProductService {
  static final List<Product> _products = [
    Product(
      id: '1',
      name: 'Graduation Hoodies',
      description: 'Premium graduation hoodie with embroidered logo',
      price: 35.00,
      image: ImageAssets.productGraduationHoodies, // ← CHANGED FROM URL
      collection: 'graduation',
      isSale: false,
    ),
    Product(
      id: '2',
      name: 'Signature Hoodie',
      description: 'Essential signature hoodie in classic colors',
      price: 32.99,
      image: ImageAssets.productSignatureHoodie, // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
    Product(
      id: '3',
      name: 'Essential T-Shirt',
      description: 'Comfortable essential t-shirt for everyday wear',
      price: 10.00,
      image: ImageAssets.productEssentialTshirt, // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
    Product(
      id: '4',
      name: 'Limited Edition Zip Hoodies',
      description: 'Exclusive limited edition zip-up hoodies',
      price: 20.00,
      image: ImageAssets.productZipHoodies, // ← CHANGED FROM URL
      collection: 'signature',
      isSale: false,
    ),
   Product(
  id: '5',
  name: 'Crested Tie',
  description: 'Elegant crested tie with university logo',
  price: 10.99,  // Changed from 15.00
  originalPrice: 15.00,  // Changed from 10.99
  image: ImageAssets.productCrestedTie,
  collection: 'graduation',
  isSale: true,
),
Product(
  id: '6',
  name: 'Essential Hoodie',
  description: 'Premium essential hoodie with university branding',
  price: 24.99,
  originalPrice: 32.00,
  image: ImageAssets.productSignatureHoodie,
  collection: 'signature',
  isSale: true,
),
Product(
  id: '7',
  name: 'Sale T-Shirt',
  description: 'Classic university t-shirt on sale',
  price: 6.99,
  originalPrice: 10.00,
  image: ImageAssets.productEssentialTshirt,
  collection: 'signature',
  isSale: true,
),
  ];
  static final List<Collection> _collections = [
    Collection(
      id: 'graduation',
      name: 'Graduation Collection',
      description: 'Official graduation apparel and accessories',
      image: ImageAssets.productGraduationHoodies,
      productCount: 2,
    ),
    Collection(
      id: 'signature',
      name: 'Signature Collection',
      description: 'Essential pieces for everyday style',
      image: ImageAssets.productSignatureHoodie,
      productCount: 3,
    ),
  ];

  static List<Product> get products => _products;

  static Future<Collection?> getCollectionById(String id) async {
    try {
      return _collections.firstWhere((collection) => collection.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Product>> getProductsByCollection(
      String collectionId) async {
    return _products
        .where((product) => product.collection == collectionId)
        .toList();
  }

  static Future<List<Collection>> getAllCollections() async {
    return _collections;
  }

  static Future<List<Product>> getSaleProducts() async {
  return _products.where((product) => product.isSale).toList();
}
  static Future<Product?> getProductById(String id) async {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
