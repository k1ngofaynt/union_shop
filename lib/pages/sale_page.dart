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