import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updateCurrentPage(index) => currentPageIndex.value = index;

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(HomePage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void dotNavigation(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
