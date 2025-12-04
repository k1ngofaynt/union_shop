import 'package:flutter/material.dart';
import 'package:union_shop/utils/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'name': 'Graduation Hoodies',
      'size': 'L',
      'color': 'Black',
      'price': 35.00,
      'quantity': 1,
      'image': 'assets/images/product_graduation_hoodies.png',
    },
    {
      'id': '2',
      'name': 'Essential T-Shirt',
      'size': 'M',
      'color': 'White',
      'price': 10.00,
      'quantity': 2,
      'image': 'assets/images/product_essential_tshirt.png',
    },
  ];
  double get subtotal {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int),
    );
  }

  double get tax => subtotal * 0.1;
  double get total => subtotal + tax;