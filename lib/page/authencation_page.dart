import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/widget/authencation/login_form.dart';
import 'package:flutter_application_1/widget/authencation/navigation_button.dart';
import 'package:flutter_application_1/widget/authencation/signup_form.dart';

import '../config/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PageController pageController;
  bool isSelectedColor = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        isSelectedColor = pageController.page == 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              LoginForm(),
              SignupForm(),
            ],
          ),
          // Page Navigation button
          NavigationButton(
            pageController: pageController,
            isSelectedColor: isSelectedColor,
          ),
        ],
      ),
    );
  }
}
