import 'package:flutter/material.dart';

import '../../config/sizes.dart';

class OnboardingItems extends StatelessWidget {
  const OnboardingItems({super.key, required this.image, required this.title, required this.titleSub});
  final String image, title, titleSub;
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: TSizes.buffer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  SizedBox(height: TSizes.spacing),
                  Text(
                   title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: TSizes.spaceBtwSection),
                  Text(titleSub),
                  SizedBox(height: TSizes.spaceBtwSection),
                ],
              ),
            );
  }
}
