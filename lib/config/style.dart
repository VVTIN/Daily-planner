import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

class TStyles {
  static String formatVNDate(DateTime date) {
    // Định dạng ngày tháng năm với thứ
    return DateFormat('EEEE, d MMMM yyyy', 'vi_VN').format(date);
  }

  static final appBar = AppBar(
    title: const Text(
      'Lịch trình kế hoạch',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    ),
    backgroundColor: TColors.blue,
  );
}
