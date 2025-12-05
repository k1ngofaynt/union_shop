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
  final List<SlideItem> _slides = [
    SlideItem(
      title: 'Essential Range - Over 20% OFF!',
      description: 'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
      buttonText: 'BROWSE COLLECTION',
      backgroundColor: Color(0xFF2B5F44),
    ),
    SlideItem(
      title: 'THE PRINT SHACK',
      description: 'Lets create something uniquely you with our personalisation service — From £3 for one line of text!',
      buttonText: 'FIND OUT MORE',
      backgroundColor: Color(0xFF1E3A5F),
    ),