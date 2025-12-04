import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/utils/constants.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  late Future<Product?> _product;
  late String _selectedSize;
  late String _selectedColor;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _product = ProductService.getProductById(widget.productId);
    _selectedSize = 'M';
    _selectedColor = 'Black';
    _quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
     return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: FutureBuilder<Product?>(
          future: _product,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Text('Product not found');
            }

            final product = snapshot.data!;
            return isMobile
                ? _buildMobileLayout(product)
                : _buildDesktopLayout(product);
          },
        ),
      ),
    );
  }

