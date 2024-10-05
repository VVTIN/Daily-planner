import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/page/authencation_page.dart';
import 'package:flutter_application_1/page/onboaring_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
