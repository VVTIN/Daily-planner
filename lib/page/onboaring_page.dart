import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/image_string.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/config/texts.dart';
import 'package:flutter_application_1/model/controller/onboardingCtrl.dart';
import 'package:flutter_application_1/widget/onboarding/dotNavigation_page.dart';
import 'package:flutter_application_1/widget/onboarding/next_page.dart';
import 'package:flutter_application_1/widget/onboarding/onBoardingItems.dart';
import 'package:flutter_application_1/widget/onboarding/skip_page.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updateCurrentPage,
          children: [
            OnboardingItems(
              image: TImages.onboarding1,
              title: TTexts.onboardingTitle1,
              titleSub: TTexts.onboardingSubTitle1,
            ),
            OnboardingItems(
              image: TImages.onboarding2,
              title: TTexts.onboardingTitle2,
              titleSub: TTexts.onboardingSubTitle2,
            ),
            OnboardingItems(
              image: TImages.onboarding3,
              title: TTexts.onboardingTitle3,
              titleSub: TTexts.onboardingSubTitle3,
            ),
          ],
        ),

        //skip page
        SkipPage(),

        // smooth navigation
        SmoothNavigation(),

        // next page
        NextPage(),
      ],
    ));
  }
}
