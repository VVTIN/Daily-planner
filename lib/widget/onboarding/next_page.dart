import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/sizes.dart';

import '../../model/controller/onboardingCtrl.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kBottomNavigationBarHeight - 24,
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
