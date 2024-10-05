import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/model/controller/onboardingCtrl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothNavigation extends StatelessWidget {
  const SmoothNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: kBottomNavigationBarHeight,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigation,
        effect: ExpandingDotsEffect(dotHeight: 5),
      ),
    );
  }
}
