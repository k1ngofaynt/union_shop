import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _featuredProducts;
  late Future<List<Collection>> _collections;
    @override
  void initState() {
    super.initState();
    _featuredProducts = ProductService.getAllProducts();
    _collections = ProductService.getAllCollections();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
     return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            color: AppColors.background,
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            child: Column(
              children: [
                Text(
                  'Graduation',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Graduation season is here — make sure you\'re stocked up and ready to celebrate in style.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/collections');
                  },
                  child: const Text('Browse Collection'),
                ),
              ],
            ),
          ),