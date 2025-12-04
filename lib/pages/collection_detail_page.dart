import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/utils/constants.dart';

class CollectionDetailPage extends StatefulWidget {
  final String collectionId;

  const CollectionDetailPage({
    Key? key,
    required this.collectionId,
  }) : super(key: key);

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}
class _CollectionDetailPageState extends State<CollectionDetailPage> {
  late Future<Collection?> _collection;
  late Future<List<Product>> _products;
  String _sortBy = 'featured';

  @override
  void initState() {
    super.initState();
    _collection = ProductService.getCollectionById(widget.collectionId);
    _products = ProductService.getProductsByCollection(widget.collectionId);
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          FutureBuilder<Collection?>(
            future: _collection,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return const Text('Collection not found');
              }

              final collection = snapshot.data!;
              return Container(
                color: AppColors.background,
                padding: EdgeInsets.all(isMobile ? 16 : 48),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      collection.name,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      collection.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          // Filters and Sort
          Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMobile)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort by:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                       DropdownButton<String>(
                        value: _sortBy,
                        items: const [
                          DropdownMenuItem(
                            value: 'featured',
                            child: Text('Featured'),
                          ),
                          DropdownMenuItem(
                            value: 'price-low',
                            child: Text('Price: Low to High'),
                          ),
                          DropdownMenuItem(
                            value: 'price-high',
                            child: Text('Price: High to Low'),
                          ),
                          DropdownMenuItem(
                            value: 'newest',
                            child: Text('Newest'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _sortBy = value ?? 'featured';
                          });
                        },
                      ),
                    ],
                  ),
                        
