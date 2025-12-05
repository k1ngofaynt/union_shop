import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/slideshow_carousel.dart';
import 'package:union_shop/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _featuredProducts;
  late Future<List<Product>> _saleProducts;
  // Collections for navigation - can be expanded later
  final List<Collection> _collections = [];
  
  // Helper to get available collections
  List<Collection> get collections => _collections;
    @override
  void initState() {
    super.initState();
    _featuredProducts = Future(() async {
      final products = await ProductService.getProductsByCollection('signature');
      return products.where((product) => !product.isSale).toList();
    });
    _saleProducts = Future.value(
      ProductService.products.where((product) => product.isSale).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
     return Column(
      children: [
        // Slideshow Carousel
        const SlideshowCarousel(),
        const SizedBox(height: 32),
        // Hero Section
        Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(
    horizontal: isMobile ? 16 : 48,
    vertical: 32,
  ),
  child: Column(
    children: [
      Text(
        'ESSENTIAL RANGE - OVER 20% OFF!',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 32),
      FutureBuilder<List<Product>>(
        future: _saleProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No sale products available');
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product/${product.id}',
                  );
                },
              );
            },
          );
            
          
        },
      ),
    ],
  ),
),
          Container(
            color: AppColors.background,
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            child: Column(
              children: [
                Text(
                  'Graduation',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Graduation season is here — make sure you\'re stocked up and ready to celebrate in style.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                FutureBuilder<List<Product>>(
                  future: ProductService.getProductsByCollection('graduation'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                     if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isMobile ? 2 : 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final product = snapshot.data![index];
                            return ProductCard(
                              product: product,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/product/${product.id}',
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                            
                    

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/collection/graduation');
                  },
                  child: const Text('Browse Collection'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
           Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 32),
            child: Column(
              children: [
                Text(
                  'SIGNATURE RANGE',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FutureBuilder<List<Product>>(
                  future: _featuredProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No products available');
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/product/${product.id}',
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Print Shack Section
          Container(
            color: AppColors.secondary,
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            child: Column(
              children: [
                Text(
                  'The Print Shack',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Let\'s create something uniquely you with our personalisation service — From £3 for one line of text!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
               ),
                  const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Find Out More',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
        ],
      );
  }
}
                    

                