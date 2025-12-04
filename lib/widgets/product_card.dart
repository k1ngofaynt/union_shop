import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/utils/constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);