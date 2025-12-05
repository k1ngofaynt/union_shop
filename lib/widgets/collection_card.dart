import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/utils/constants.dart';

class CollectionCard extends StatefulWidget {
  final Collection collection;
  final VoidCallback onTap;

  const CollectionCard({
    Key? key,
    required this.collection,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CollectionCard> createState() => _CollectionCardState();
}
