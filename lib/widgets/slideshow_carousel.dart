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
       backgroundImage: ImageAssets.productSaleTshirt,
    ),
    SlideItem(
      title: 'The Print Shack',
      description: 'Lets create something uniquely you with our personalisation service — From £3 for one line of text!',
      buttonText: 'FIND OUT MORE',
      backgroundImage: ImageAssets.slidePrintShack,
    ),
    SlideItem(
      title: 'Hungry',
      description: 'We got this',
      buttonText: 'ORDER DOMINOS PIZZA NOW',
      backgroundImage: ImageAssets.slideDominosPizza,
    ),
    SlideItem(
      title: 'What is your next move...',
      description: 'Are you with us?',
      buttonText: 'FIND YOUR STUDENT ACCOMMODATION',
      backgroundImage: ImageAssets.slideApartment,
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
  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _startAutoPlay();
      } else {
        _timer?.cancel();
      }
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: isMobile ? 400 : 500,
      child: Stack(
        children: [
          // Slideshow
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _slides.length,
            itemBuilder: (context, index) {
              return _buildSlide(_slides[index], isMobile);
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                onPressed: _togglePlayPause,
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),
                tooltip: _isPlaying ? 'Pause slideshow' : 'Play slideshow',
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSlide(SlideItem slide, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: slide.backgroundColor,
        image: slide.backgroundImage != null
            ? DecorationImage(
                image: AssetImage(slide.backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 24 : 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                slide.title,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                slide.description,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Dummy link - no functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: slide.backgroundColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 40,
                    vertical: isMobile ? 14 : 18,
                  ),
                  textStyle: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(slide.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideItem {
  final String title;
  final String description;
  final String buttonText;
  final Color backgroundColor;

  SlideItem({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.backgroundColor,
  });
}
