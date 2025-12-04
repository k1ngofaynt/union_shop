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