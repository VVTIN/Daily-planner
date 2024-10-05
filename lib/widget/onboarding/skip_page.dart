import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/model/controller/onboardingCtrl.dart';

class SkipPage extends StatelessWidget {
  const SkipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
