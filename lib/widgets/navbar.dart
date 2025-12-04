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
class _NavbarState extends State<Navbar> {
  late TextEditingController _searchController;
  bool _isMobileMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
  return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 16,
      ),
      child: isMobile ? _buildMobileNavbar() : _buildDesktopNavbar(context),
    );
  }
  Widget _buildDesktopNavbar(BuildContext context) {
    return Row(
      children: [
        // Logo
        Expanded(
          flex: 1,
          child: Text(
            'Union Shop',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),