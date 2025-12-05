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
    SlideItem(
      title: 'Hungry',
      description: 'We got this',
      buttonText: 'ORDER DOMINOS PIZZA NOW',
      backgroundColor: Color(0xFF5F2B3E),
    ),
    SlideItem(
      title: 'WHAT IS YOUR NEXT MOVE...',
      description: 'Are you with us?',
      buttonText: 'FIND YOUR STUDENT ACCOMMODATION',
      backgroundColor: Color(0xFF3E5F2B),
    ),
  ];
  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer?.cancel();
    if (_isPlaying) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_currentPage < _slides.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }