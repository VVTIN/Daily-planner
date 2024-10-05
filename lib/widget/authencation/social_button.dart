import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/image_string.dart';
import '../../config/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: TColors.black,
            ),
          ),
          child: const Image(
            image: AssetImage(TImages.google),
            width: 34,
            height: 34,
          ),
        ),
        // SizedBox(width: TSizes.spaceBtwItem),
      ],
    );
  }
}
