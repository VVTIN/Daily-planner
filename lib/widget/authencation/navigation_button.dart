import 'package:flutter/material.dart';
import '../../config/colors.dart';

class NavigationButton extends StatelessWidget {
  final PageController pageController;
  final bool isSelectedColor;

  const NavigationButton({
    super.key,
    required this.pageController,
    required this.isSelectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 4,
      right: MediaQuery.of(context).size.width / 5,
      top: kToolbarHeight * 2,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelectedColor ? TColors.black : TColors.gray,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              foregroundColor: TColors.white,
            ),
            child: const Text('Đăng nhập'),
          ),
          ElevatedButton(
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: !isSelectedColor ? TColors.black : TColors.gray,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              foregroundColor: TColors.white,
            ),
            child: const Text('Đăng ký'),
          ),
        ],
      ),
    );
  }
}
