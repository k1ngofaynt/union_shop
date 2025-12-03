import 'package:flutter/material.dart';
import 'package:union_shop/utils/constants.dart';

class Navbar extends StatefulWidget {
  final String currentRoute;

  const Navbar({
    Key? key,
    required this.currentRoute,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

