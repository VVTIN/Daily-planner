import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/config/texts.dart';
import 'package:flutter_application_1/config/theme.dart';
import 'package:flutter_application_1/page/calendar_page.dart';
import 'package:flutter_application_1/page/setting_page.dart';
import 'package:flutter_application_1/page/statistical_page.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'page/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //Dark - Light mode
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: TColors.blue,
              centerTitle: true,
              title: Text(
                TTexts.logoName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              actions: [
                Obx(
                  () => IconButton(
                    onPressed: themeController.toggleTheme,
                    icon: Icon(themeController.isDarkMode.value
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    color: TColors.yellow,
                  ),
                ),
              ],
            )
          : null,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          TaskPage(),
          CalendarPage(),
          StatisticalPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.task,
            color: TColors.white,
            size: 32,
          ),
          Icon(
            Icons.calendar_today,
            color: TColors.white,
            size: 32,
          ),
          Icon(
            Icons.query_stats_outlined,
            color: TColors.white,
            size: 32,
          ),
          Icon(
            Icons.settings,
            color: TColors.white,
            size: 32,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        color: TColors.blue,
        height: 60,
      ),
    );
  }
}
