import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/utils/constants.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}
class _CollectionsPageState extends State<CollectionsPage> {
  late Future<List<Collection>> _collections;

  @override
  void initState() {
    super.initState();
    _collections = ProductService.getAllCollections();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
     return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            color: AppColors.background,
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Our Collections',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Browse our exclusive collections of premium merchandise',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),