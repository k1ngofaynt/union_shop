import 'dart:async';
import 'package:flutter/material.dart';

class SlideshowCarousel extends StatefulWidget {
  const SlideshowCarousel({Key? key}) : super(key: key);

  @override
  State<SlideshowCarousel> createState() => _SlideshowCarouselState();
}
class _SlideshowCarouselState extends State<SlideshowCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  bool _isPlaying = true;