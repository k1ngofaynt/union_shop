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