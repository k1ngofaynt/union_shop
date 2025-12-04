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
      home: const AppShell(),
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

      