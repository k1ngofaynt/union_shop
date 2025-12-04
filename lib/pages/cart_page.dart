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
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (cartItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: AppColors.textLight,
            ),
            const SizedBox(height: 16),
            Text(
              'Your cart is empty',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/collections');
              },
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      );
    }
     return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),