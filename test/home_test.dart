import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
void main() {
  group('Home Page Tests', () {
    testWidgets('should display app and home page', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Check that the app loads
      expect(find.byType(MaterialApp), findsOneWidget);
    });
    testWidgets('should display slideshow carousel', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Check that slideshow text is present
      expect(find.textContaining('Essential Range'), findsWidgets);
    });
