import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_card.dart';

class SalePage extends StatefulWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}
class _SalePageState extends State<SalePage> {
  List<Product> _saleProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSaleProducts();
  }
  Future<void> _loadSaleProducts() async {
    final saleProducts = await ProductService.getSaleProducts();
    setState(() {
      _saleProducts = saleProducts;
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(bottom: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF4d2963),
                  const Color(0xFF6B3A82),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),