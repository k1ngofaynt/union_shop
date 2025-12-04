import 'package:flutter/material.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_detail_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppShell(),
        '/about': (context) => const AppShell(page: 'about'),
        '/collections': (context) => const AppShell(page: 'collections'),
        '/cart': (context) => const AppShell(page: 'cart'),
      },
       onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/product/') ?? false) {
          final productId = settings.name?.split('/').last;
          return MaterialPageRoute(
            builder: (context) => AppShell(
              page: 'product',
              productId: productId,
            ),
          );
        }
        if (settings.name?.startsWith('/collection/') ?? false) {
          final collectionId = settings.name?.split('/').last;
          return MaterialPageRoute(
            builder: (context) => AppShell(
              page: 'collectionDetail',
              collectionId: collectionId,
            ),
          );
        }
        return null;
      },
    );
  }
}
class AppShell extends StatefulWidget {
  final String page;
  final String? productId;
  final String? collectionId;

  const AppShell({
    Key? key,
    this.page = 'home',
    this.productId,
    this.collectionId,
  }) : super(key: key);

  @override
  State<AppShell> createState() => _AppShellState();
}
class _AppShellState extends State<AppShell> {
  late String _currentRoute;

  @override
  void initState() {
    super.initState();
    _updateRoute();
  }

  @override
  void didUpdateWidget(AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.page != widget.page) {
      _updateRoute();
    }
  }
  void _updateRoute() {
    switch (widget.page) {
      case 'about':
        _currentRoute = '/about';
        break;
      case 'collections':
        _currentRoute = '/collections';
        break;
      case 'cart':
        _currentRoute = '/cart';
        break;
      case 'product':
        _currentRoute = '/product/${widget.productId}';
        break;
      default:
        _currentRoute = '/';
    }
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(currentRoute: _currentRoute),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildContent(),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildContent() {
    switch (widget.page) {
      case 'about':
        return const AboutPage();
      case 'collections':
        return const CollectionsPage();
      case 'cart':
        return const CartPage();
      case 'product':
        return ProductPage(productId: widget.productId ?? '');
      case 'collectionDetail':
        return CollectionDetailPage(collectionId: widget.collectionId ?? '');
      default:
        return const HomePage();
    }
  }
}


      