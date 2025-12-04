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
     return Padding(
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
            if (isMobile)
              _buildMobileCart()
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildCartItems(),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    flex: 1,
                    child: _buildOrderSummary(),
                  ),
                ],
              ),
          ],
        ),
      );
  }
  Widget _buildMobileCart() {
    return Column(
      children: [
        _buildCartItems(),
        const SizedBox(height: 32),
        _buildOrderSummary(),
      ],
    );
  }
  Widget _buildCartItems() {
    return Column(
      children: cartItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return _CartItemWidget(
          item: item,
          onRemove: () {
            setState(() {
              cartItems.removeAt(index);
            });
          },
          onQuantityChanged: (newQuantity) {
            setState(() {
              cartItems[index]['quantity'] = newQuantity;
            });
          },
        );
      }).toList(),
    );
  }
   Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _summaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _summaryRow('Tax (10%)', '\$${tax.toStringAsFixed(2)}'),
          const Divider(),
          _summaryRow(
            'Total',
            '\$${total.toStringAsFixed(2)}',
            isBold: true,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Order placed successfully!'),
                  ),
                );
              },
              child: const Text('Proceed to Checkout'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/collections');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.secondary,
                side: const BorderSide(color: AppColors.secondary),
              ),
              child: const Text('Continue Shopping'),
            ),
          ),
        ],
      ),
    );
  }
  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
class _CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  const _CartItemWidget({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            item['image'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 100,
                color: AppColors.background,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Size: ${item['size']}, Color: ${item['color']}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(4),
                    onPressed: () {
                      if (item['quantity'] > 1) {
                        onQuantityChanged(item['quantity'] - 1);
                      }
                    },
                  ),
                  Text(item['quantity'].toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(4),
                    onPressed: () {
                      onQuantityChanged(item['quantity'] + 1);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.delete, color: AppColors.accent),
                onPressed: onRemove,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
