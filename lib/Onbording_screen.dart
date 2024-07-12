import 'package:flutter/material.dart';
import 'package:intro_screen/intro_page/intro_page1.dart';
import 'package:intro_screen/intro_page/intro_page2.dart';
import 'package:intro_screen/intro_page/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './homepage.dart'; // Import HomePage

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: TextButton(
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: TextButton(
              onPressed: () {
                if (isLastPage) {
                  Navigator.of(context).pushReplacement(
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                isLastPage ? 'Done' : 'Next',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                type: WormType.normal,
                activeDotColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
