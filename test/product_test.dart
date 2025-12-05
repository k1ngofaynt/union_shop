import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/product_service.dart';

void main() {
  group('Product Tests', () {
    test('should create a product with all properties', () {
      final product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Test Description',
        price: 19.99,
        image: 'assets/images/test.png',
        collection: 'test',
        isSale: false,
      );