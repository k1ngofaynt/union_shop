import 'product.dart';

class CartItemModel {
  final String id;
  final Product product;
  int quantity;
  String selectedSize;
  String selectedColor;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.selectedSize,
    required this.selectedColor,
  });
  
  double get totalPrice => product.price * quantity;
}