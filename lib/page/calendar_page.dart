// ignore: depend_on_referenced_packages
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/config/style.dart';
import 'package:flutter_application_1/widget/home/date_picker.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TStyles.appBar,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hôm nay',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.0),

            //date picker
            DatePickerForm(),
          ],
        ),
      ),
    );
  }
}
