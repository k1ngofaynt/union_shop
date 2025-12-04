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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFF4d2963),
          child: const Text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          color: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 32,
            vertical: 16,
          ),
          child: isMobile ? _buildMobileNavbar() : _buildDesktopNavbar(context),
        ),
      ],
    );
  }
  Widget _buildDesktopNavbar(BuildContext context) {
    return Row(
      children: [
        // Logo
        Expanded(
          flex: 1,
          child: Text(
            'The Union',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navLink(context, 'Home', '/'),
              const SizedBox(width: 24),
              _navLink(context, 'Collections', '/collections'),
              const SizedBox(width: 24),
              _navLink(context, 'About', '/about'),
              const SizedBox(width: 24),
              _saleNavLink(context, 'SALE!', '/sale'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
               const SizedBox(width: 16),
              _cartIcon(context),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildMobileNavbar() {
    return Column(
      children: [
        // Top row: Logo and menu button
        Row(
          children: [
            const Expanded(
              child: Text(
                'Union Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
  IconButton(
              icon: Icon(
                _isMobileMenuOpen ? Icons.close : Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isMobileMenuOpen = !_isMobileMenuOpen;
                });
              },
            ),
          ],
        ),
  if (_isMobileMenuOpen) ...[
          const SizedBox(height: 12),
          // Search
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Menu items
          _mobileNavLink('Home', '/'),
          _mobileNavLink('Collections', '/collections'),
          _mobileNavLink('About', '/about'),
          _mobileSaleNavLink('SALE!', '/sale'),
          _mobileNavLink('Cart', '/cart'),
        ],
      ],
    );
  }
  Widget _navLink(BuildContext context, String label, String route) {
    final isActive = widget.currentRoute == route;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.secondary : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
  Widget _saleNavLink(BuildContext context, String label, String route) {
    final isActive = widget.currentRoute == route;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.secondary : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  Widget _mobileNavLink(String label, String route) {
    final isActive = widget.currentRoute == route;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
          setState(() {
            _isMobileMenuOpen = false;
          });
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
   Widget _mobileSaleNavLink(String label, String route) {
    final isActive = widget.currentRoute == route;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
          setState(() {
            _isMobileMenuOpen = false;
          });
           },
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.secondary : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget _cartIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/cart');
      },
      child: const Badge(
        label: Text('2'),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
  